require "rack/utils"
require 'rack/var_dump/kernel'
require 'rack/var_dump/version'
require 'rack/var_dump/awesome_print'
require 'rack/var_dump/response'
require 'rack/var_dump/variable'

module Rack
  class VarDump
    @@var_aggregates = []

    def self.var_aggregates
      @@var_aggregates
    end

    def self.reset!
      @@var_aggregates = []
    end

    def self.var_dump(var, subject, options = {})
      default = { :html => true }
      @@var_aggregates << Variable.new(var, subject, default.merge(options))
    end

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      Response.call(status, headers, response)
    end
  end
end
