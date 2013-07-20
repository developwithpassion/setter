# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'setter'
  s.summary = 'Setter Library'
  s.version = '0.0.3'
  s.authors = ['The Sans Collective']
  s.homepage = 'https://github.com/Sans/setter'
  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.2'

  s.add_dependency 'null_object'
end
