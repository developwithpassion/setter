require_relative '../proofs_init'

s = Sender.new
s.some_setting = 'some value'
s.other_setting = 'other value'

r = Receiver.new

s.set r
# proof: set?(:setting), sends sym to both objects
raise "Fail: value not set" unless r.some_setting == s.some_setting
raise "Fail: value not set" unless r.other_setting == s.other_setting
