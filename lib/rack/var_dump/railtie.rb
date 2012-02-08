require 'rails'
require 'rack/var_dump'

module Rack
  class VarDump
    class Railtie < Rails::Railtie
      initializer "rack_var_dump.use_middleware" do |app|
        app.middleware.use ::Rack::VarDump if ENV['RAILS_ENV'] == "development"
      end
    end
  end
end
