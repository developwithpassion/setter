require_relative 'proofs_init'

r = Receiver.new
# proof: recorded?(:setting, :setting), sends sym to both objects
raise "Fail: setting not recorded" unless r.class.settings.include? :some_setting
raise "Fail: setting not recorded" unless r.class.settings.include? :other_setting
