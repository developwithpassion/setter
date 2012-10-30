require_relative 'proofs_init'
require_relative 'examples'

s = Source.new
s.some_setting = 'some value'

d = Destination.new
raise "Fail: setting not recorded" unless d.class.settings.include? :some_setting

s.set d, :some_setting
raise "Fail: value not set" unless d.some_setting
