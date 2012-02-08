module AwesomePrint
  class VarDump < Formatter
    def format(object, type = nil)
      core_class = cast(object, type)

      awesome = if core_class != :self
        send(:"awesome_#{core_class}", object) # Core formatters.
      else
        awesome_self(object, type) # Catch all that falls back to object.inspect.
      end
    end
  end
end

