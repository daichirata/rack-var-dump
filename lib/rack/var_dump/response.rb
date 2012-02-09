module Rack
  class VarDump
    class Response
      def self.call(*args)
        self.new(*args)._call
      end

      def initialize(status, headers, response)
        @status   = status
        @headers  = headers
        @response = response
        @var_aggregates = VarDump.var_aggregates
      end


      def _call
        if @headers["Content-Type"] =~ /^text\/html/ && !@var_aggregates.empty?
          body = ""
          @response.each {|org_body| body << org_body}
          @response = [apply(body)] if body =~ /<body.*>/
          @headers["Content-Length"] = @response.join.bytesize.to_s
        end

        VarDump.reset!
        [@status, @headers, @response]
      end

      private
      def apply(body)
        html = <<-HTML
<style type="text/css">
<!--
#raci-var-dump pre {
  background-color: #eee;
  padding: 10px;
  font-size: 11px;
  white-space: pre-wrap;
  color: black!important;
}
-->
</style>
<div id="rack-var-dump" style="display:block">
<pre>
        HTML

        @var_aggregates.each_with_index do |variable, index|
          html << <<-EOH
var_dump:#{index} #{variable.subject}
#{variable.dump}

          EOH
        end

        html << "</pre></div>"
        body.sub(/<body.*>/, '\&' + html)
      end
    end
  end
end
