#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end


# Dummy App
# -----------------------------------------------------------------------------
APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'
Bundler::GemHelper.install_tasks

Rake::Task['app:db:load_config'].clear
task 'app:db:load_config' do
  ActiveRecord::Base.configurations = Rails.application.config.database_configuration
  ActiveRecord::Migrator.migrations_paths = Rails.application.paths['db/migrate'].to_a
end


# RSpec
# -----------------------------------------------------------------------------
task 'db:test:prepare' => 'app:db:test:prepare'
load 'rspec/rails/tasks/rspec.rake'

namespace :spec do

  [:engine].each do |sub|
    desc "Run the code examples in spec/#{sub}"
    RSpec::Core::RakeTask.new(sub => 'db:test:prepare') do |t|
      t.pattern = "./spec/#{sub}/**/*_spec.rb"
    end
  end

end


# Evergreen
# -----------------------------------------------------------------------------
require 'evergreen/tasks'



# Default
# -----------------------------------------------------------------------------
#Rake::Task['default'].prerequisites.clear
#Rake::Task['default'].clear

task :default => ['spec:javascripts']
