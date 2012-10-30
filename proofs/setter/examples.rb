class Implementation
  def some_method
  end
end

class Receiver
  include Setter::Settings

  setting :some_setting
  setting :other_setting

  module Proof
    def set?(attribute, sender)
      send(attribute) == sender.send(attribute)
    end

    def all_set?(sender)
      self.class.settings.each do |setting|
        set? setting, sender
      end
    end

    def settings_recorded?(attributes)
      self.class.settings.sort <=> attributes.sort
    end
  end
end

class ReceiverWithDefaultSetting
  include Setter::Settings

  setting :default_setting, :default => 13
end

class ReceiverWithNullObject
  include Setter::Settings

  setting :null_object, :default => null_object(Implementation)
end

class Sender
  include Setter

  attr_accessor :some_setting
  attr_accessor :other_setting
end
