require "rack/utils"
require "rack/var_dump/object"
require "rack/var_dump/version"

module Rack
  class VarDump
    include Object

    @@var_aggregates = []

    def self.var_dump(var, subject)
      @@var_aggregates << {:var => var.inspect, :subject => subject}
    end

    def self.reset!
      @@var_aggregates = []
    end

    def initialize(app)
      @app = app
      VarDump.reset!
    end

    def call(env)
      request = Rack::Request.new(env)
      status, headers, response = @app.call(env)

      if /^text\/html/ =~ headers["Content-Type"] && !@@var_aggregates.empty?
        body = ""
        response.each {|org_body| body << org_body}
        response = [apply(request, body)] if body =~ /<body.*>/
        headers["Content-Length"] = response.join.bytesize.to_s
      end
      VarDump.reset!
      [status, headers, response]
    end

    private
    def apply(request, response)
      html =  '<div id="var_dump" style="display:block">'
      html << '<pre style="background-color:#eee;padding:10px;font-size:11px;white-space:pre-wrap;color:black!important;">'
      @@var_aggregates.each_with_index do |info, n|
        html << "var_dump:#{n} #{info[:subject]}\n"
        html << Rack::Utils.escape_html(info[:var])
        html << "\n\n"
      end
      html << "</pre></div>"
      response.sub(/<body.*>/, '\&' + html)
    end
  end
end
