require_relative 'proofs_init'

s = Source.new
s.some_setting = 'some value'
s.other_setting = 'other value'

d = Destination.new
# proof: recorded?(:setting, :setting), sends sym to both objects
raise "Fail: setting not recorded" unless d.class.settings.include? :some_setting
raise "Fail: setting not recorded" unless d.class.settings.include? :other_setting

s.set d
# proof: set?(:setting), sends sym to both objects
raise "Fail: value not set" unless d.some_setting == s.some_setting
raise "Fail: value not set" unless d.other_setting == s.other_setting
