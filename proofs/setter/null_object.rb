require_relative '../proofs_init'

s = Sender.new

r = ReceiverWithNullObject.new

s.set r
implementation = r.null_object

# proof: null_object should be the default if default is set and setting isn't
raise "Fail: null_object is not the default setting" unless implementation

# proof: null_object responds `nil` to implemented methods
raise "Fail: null_object didn't respond with `nil`" unless implementation.some_method == nil

# proof: null_object throws if not implemented method called
begin
  implementation.foo
  raise "Fail: null_object did not throw when called with unimplemented method"
rescue NoMethodError
end