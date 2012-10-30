require_relative '../proofs_init'

desc "Respond with nil to implemented methods"
Proof.start do
  r = Receiver.new

  r.prove { no_op? setting_with_default_null_object.some_method }
end

desc "Raise NoMethodError if unimplememented method called"
Proof.start do
  r = Receiver.new

  r.prove { no_method? { setting_with_default_null_object.foo }}
end
