require_relative '../proofs_init'

desc "Record setting attributes names"
Proof.start do
  r = Receiver.new
  r.prove { settings_recorded? [:some_setting, :other_setting] }
end
