# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name = 'setter'
  s.summary = 'Setter Library'
  s.version = '0.0.2'
  s.authors = ['The Sans Collective']
  s.homepage = 'https://github.com/Sans/setter'
  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.2'

  s.add_dependency 'null_object'
end
