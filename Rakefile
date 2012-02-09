require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

def app_task(name)
  task name => [:load_app, "app:db:#{name}"]
end

desc "Debugging tasks for local development"
task :debug do
  rmdir "pkg"
  sh "rake build"
  sh "gem uninstall rack-var-dump"
  sh "gem install pkg/rack-var-dump"
end
