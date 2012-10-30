class Receiver
  include Setter::Settings

  setting :some_setting
  setting :other_setting
end

class Sender
  include Setter

  attr_accessor :some_setting
  attr_accessor :other_setting
  attr_accessor :yet_another_setting
end
