require_relative '../proofs_init'

proof "Transfer specific setting attribute value from sender to receiver" do
  s = Sender.new
  s.some_setting = 'some value'

  r = Receiver.new
  s.set r, :some_setting

  r.prove { set? :some_setting, s }
end
