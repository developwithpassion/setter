require_relative '../proofs_init'

s = Sender.new

r = ReceiverWithDefaultSetting.new

s.set r

# proof: unpopulated settings should take on the default value
raise "Fail: setting not populated with default value" unless r.default_setting == 13