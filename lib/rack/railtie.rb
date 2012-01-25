require 'rails'
require 'rack/object'

module Rack
  autoload :VarDump, "rack/var_dump"
  include Object

  class Railtie < Rails::Railtie
    initializer "rack_var_dump.use_middleware" do |app|
      app.middleware.use Rack::VarDump if ENV['RAILS_ENV'] == "development"
    end
  end
end
