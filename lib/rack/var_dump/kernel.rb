module Kernel
  def var_dump(subject = nil, options = {})
    Rack::VarDump.var_dump(self, subject, options)
    self
  end
end
