require_relative '../proofs_init'

proof "Respond with nil to implemented methods" do
  r = Receiver.new

  r.prove { no_op? setting_with_default_null_object.some_method }
end

proof "Raise NoMethodError if unimplemented method called" do
  r = Receiver.new

  r.prove { no_method? { setting_with_default_null_object.foo }}
end
