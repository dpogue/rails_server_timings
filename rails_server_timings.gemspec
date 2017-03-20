# encoding: utf-8
require File.expand_path('../lib/rails_server_timings/version', __FILE__)

Gem::Specification.new do |s|
  s.name      = 'rails_server_timings'
  s.version   = RailsServerTimings::VERSION
  s.authors   = ['Darryl Pogue']
  s.email     = 'darryl@dpogue.ca'
  s.homepage  = 'https://github.com/dpogue/rails_server_timings'
  s.license   = 'MIT'

  s.summary   = 'Server Timing headers for Rails apps'

  s.files      = [
    '.editorconfig',
    '.gitignore',
    'CODE_OF_CONDUCT.md',
    'Gemfile',
    'LICENCE',
    'README.md',
    'Rakefile',
    'lib/rails_server_timings.rb',
    'lib/rails_server_timings/controller_runtime.rb',
    'lib/rails_server_timings/railtie.rb',
    'lib/rails_server_timings/version.rb',
    'rails_server_timings.gemspec'
  ]
  s.executables   = []
  s.require_paths = ['lib']

  s.add_runtime_dependency('railties', '>= 3.0.0')
end
