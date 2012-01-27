module Rack
  class VarDump
    module Object
      def self.included(obj)
        ::Object.send(:include, Method)
        ::Object.extend(Method)
      end
    end

    module Method
      def var_dump(subject = nil)
        Rack::VarDump.var_dump(self, subject)
        self
      end
    end
  end
end
