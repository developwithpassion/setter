require_relative '../proofs_init'

proof "Record setting attributes names" do
  r = Receiver.new
  r.prove { settings_recorded? [:some_setting, :other_setting] }
end
