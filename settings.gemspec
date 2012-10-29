# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name = "settings"
  s.summary = "Module for settings magic"
  s.version = "0.0.0"
  s.require_paths = ["lib"]
  s.files = Dir.glob("{lib}/**/*")
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = ">= 1.9.2"
end
