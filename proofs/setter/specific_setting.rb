require_relative 'proofs_init'

s = Sender.new
s.some_setting = 'some value'

r = Receiver.new
raise "Fail: setting not recorded" unless r.class.settings.include? :some_setting

s.set r, :some_setting
raise "Fail: value not set" unless r.some_setting
