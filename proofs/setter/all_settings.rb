require_relative '../proofs_init'

proof "Transfer all setting attribute values from sender to receiver" do
  s = Sender.new
  s.some_setting = 'some value'

  r = Receiver.new
  s.set r, :some_setting

  r.prove { all_set? s }
end
