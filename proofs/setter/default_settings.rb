require_relative '../proofs_init'

proof "Set default setting value" do
  r = Receiver.new

  r.prove { setting_with_default == 13 }
end
