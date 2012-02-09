module Rack
  class VarDump
    class Variable
      attr_reader :subject

      def initialize(var, subject, options = {})
        @variable = var
        @subject  = subject
        @options  = options
      end

      def dump
        @options[:plain] ? inspect_dump : ai_dump
      end

      def inspect_dump
        @variable.inspect
      end
      private :inspect

      def ai_dump
        ap = AwesomePrint::Inspector.new(@options)
        ap.instance_eval do
          formatter = AwesomePrint::VarDump.new(self)
          instance_variable_set(:@formatter, formatter)
        end

        ap.awesome(@variable)
      end
      private :ai_dump
    end
  end
end
