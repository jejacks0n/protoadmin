# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'protoadmin/version'

Gem::Specification.new do |s|
  s.name        = 'protoadmin'
  s.version     = Protoadmin::VERSION
  s.authors     = ['Jeremy Jackson']
  s.email       = ['jejacks0n@gmail.com']
  s.homepage    = 'http://github.com/jejacks0n/protoadmin'
  s.summary     = 'Protoadmin: Rails admin interface using twitter bootstrap'
  s.description = 'A Rails admin interface base built on twitter bootstrap, coffeescript, haml, sass'
  s.licenses    = ['MIT']

  s.files       = Dir["{lib,app,config,db,vendor}/**/*"] + ["MIT.LICENSE", "README.md"]
  s.test_files  = Dir["{spec}/**/*"]

  # Runtime Dependencies
  s.add_dependency 'railties', ['>= 3.2.5','< 5']
  s.add_dependency 'haml-rails'
  s.add_dependency 'sass-rails'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'font-awesome-sass-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'navigasmic'
  s.add_dependency 'devise'
  s.add_dependency 'simple_form'
  s.add_dependency 'crummy'
  s.add_dependency 'pjax_rails'
end
