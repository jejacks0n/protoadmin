# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'protoadmin/version'

Gem::Specification.new do |s|

  # General Gem Information
  s.name        = 'protoadmin'
  s.date        = '2012-09-21'
  s.version     = Protoadmin::VERSION
  s.authors     = ['Jeremy Jackson']
  s.email       = ['jejacks0n@gmail.com']
  s.homepage    = 'http://github.com/jejacks0n/protoadmin'
  s.summary     = %Q{Protoadmin: Rails admin interface using twitter bootstrap}
  s.description = %Q{A Rails admin interface base built on twitter bootstrap, coffeescript, haml, sass}
  s.licenses    = ['MIT']

  # Runtime Dependencies
  s.add_dependency 'rails', '~> 3.2.8'
  s.add_dependency 'haml-rails'
  s.add_dependency 'sass-rails'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'font-awesome-sass-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'navigasmic'
  s.add_dependency 'devise'
  s.add_dependency 'simple_form'
  s.add_dependency 'crummy'

  # Test Dependencies
  s.add_development_dependency 'evergreen', '>= 1.0.0'
  s.add_development_dependency 'rspec-rails'

  # Gem Files
  s.extra_rdoc_files  = %w(LICENSE)
  # = MANIFEST =
  s.files             = Dir['lib/**/*', 'vendor/assets/**/*']
  s.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  # = MANIFEST =
  s.require_paths     = %w(lib)

end
