module Rack
  module Object
    def self.included(obj)
      ::Object.send(:include, Method)
      ::Object.extend(Method)
    end
  end

  module Method
    def var_dump(var = nil)
      Rack::VarDump.var_dump(var || self)
      self
    end
  end
end
