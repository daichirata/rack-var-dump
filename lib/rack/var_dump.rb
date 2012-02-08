require "rack/utils"
require 'rack/var_dump/kernel'
require 'rack/var_dump/version'
require 'rack/var_dump/awesome_print'

module Rack
  class VarDump
    @@var_aggregates = []

    def self.reset!
      @@var_aggregates = []
    end

    def self.var_dump(var, subject)
      @@var_aggregates <<
        { :var => ai(var, :html => true), :subject => subject }
    end

    def self.ai(var, options = {})
      ap = AwesomePrint::Inspector.new(options)
      ap.instance_eval do
        formatter = AwesomePrint::VarDump.new(self)
        instance_variable_set(:@formatter, formatter)
      end

      ap.awesome(var)
    end

    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      status, headers, response = @app.call(env)

      if headers["Content-Type"] =~ /^text\/html/ && !@@var_aggregates.empty?
        body = ""
        response.each {|org_body| body << org_body}
        response = [apply(body)] if body =~ /<body.*>/
        headers["Content-Length"] = response.join.bytesize.to_s
      end

      VarDump.reset!
      [status, headers, response]
    end

    private
      def apply(body)
        html =  '<div id="var_dump" style="display:block">'
        html << '<pre style="background-color:#eee;padding:10px;font-size:11px;white-space:pre-wrap;color:black!important;">'
        @@var_aggregates.each_with_index do |info, n|
          html << "var_dump:#{n} #{info[:subject]}\n"
          html << info[:var]
          html << "\n\n"
        end
        html << "</pre></div>"

        body.sub(/<body.*>/, '\&' + html)
      end
  end
end
