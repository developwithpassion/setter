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

class Sender
  include Setter

  attr_accessor :some_setting
  attr_accessor :other_setting
end
