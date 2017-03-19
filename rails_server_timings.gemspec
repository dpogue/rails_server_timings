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

  s.require_paths = ['lib']
  s.executable    = []

  s.add_runtime_dependency('railties', '>= 3.0.0')
end
