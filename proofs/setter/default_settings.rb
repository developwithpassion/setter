require_relative '../proofs_init'

desc "Set default setting value"
Proof.start do
  r = Receiver.new

  r.prove { setting_with_default == 13 }
end
