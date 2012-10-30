require_relative 'proofs_init'

s = Sender.new
s.some_setting = 'some value'

r = Receiver.new

s.set r, :some_setting
raise "Fail: value not set" unless r.some_setting
