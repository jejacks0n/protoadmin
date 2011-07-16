#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Protoadmin::Application.load_tasks

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = 'protoadmin'
  gem.homepage = 'https://github.com/jejacks0n/protoadmin'
  gem.license = 'MIT'
  gem.summary = %Q{A nice admin interface for Rails 3.1 (includes generators)}
  gem.description = %Q{ProtoAdmin is a Rails 3.1 interface for admin style management tools}
  gem.email = 'jejacks0n@gmail.com'
  gem.authors = ['Jeremy Jackson']
  # dependencies defined in Gemfile
  [
    '.gitignore',
    '.rspec',
    '.rvmrc',
    'config.ru',
    'Gemfile',
    'Gemfile.lock',
    'Rakefile',
    'README.md',
    'VERSION',
    'script/*',

    'app/controllers/**/*',
    'app/models/**/*',
    'app/views/application/**/*',
    'config/environments/*',
    'config/initializers/*',
    'config/application.rb',
    'config/boot.rb',
    'config/database.yml',
    'config/environment.rb',
    'log/*',
    'log/.gitkeep',
    'public/**/*',
    ].each do |file_or_dir|
      gem.files.exclude file_or_dir
  end
end
Jeweler::RubygemsDotOrgTasks.new
