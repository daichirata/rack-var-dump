require 'rails'
require 'rack/var_dump'
require 'rack/var_dump/object'
require 'rack/var_dump/version'

module Rack
  class VarDump
    include Object
  end

  class Railtie < Rails::Railtie
    initializer "rack_var_dump.use_middleware" do |app|
      app.middleware.use Rack::VarDump if ENV['RAILS_ENV'] == "development"
    end
  end
end
