module Kernel
  def var_dump(subject = nil)
    Rack::VarDump.var_dump(self, subject)
    self
  end
end
