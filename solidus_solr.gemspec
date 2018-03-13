# encoding: UTF-8

$:.push File.
expand_path('lib', __dir__)

require 'solidus_solr/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_solr'
  s.version     = SolidusSolr::VERSION
  s.author      = 'Jonathan Tapia'
  s.email       = 'jonathan.tapia@magmalabs.io'
  s.homepage    = 'https://github.com/jtapia/solidus_solr'
  s.summary     = 'Solidus Solr extension'
  s.description = 'Adds solr implementation to extend search'
  s.license     = 'BSD-3-Clause'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  solidus_version = ['>= 1.0', '< 3']
  s.add_dependency 'solidus_core', solidus_version
  s.add_dependency 'solidus_support'
  s.add_dependency 'deface', '~> 1.0'
  s.add_dependency 'sunspot_rails'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'progress_bar'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rspec-solr'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rspec'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sunspot_test'
end
