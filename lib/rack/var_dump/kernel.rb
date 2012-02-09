module Kernel
  def var_dump(subject = nil, options = {})
    if subject.kind_of?(Hash)
      options = subject
      subject = nil
    end

    Rack::VarDump.var_dump(self, subject, options)
    self
  end
end
