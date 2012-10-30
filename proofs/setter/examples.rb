class SomeImplementation
  def some_method
  end
end

class Receiver
  include Setter::Settings

  setting :some_setting
  setting :other_setting
  setting :setting_with_default, :default => 13
  setting :setting_with_default_null_object, :default => null_object(SomeImplementation)

  module Proof
    def set?(attribute, sender)
      send(attribute) == sender.send(attribute)
    end

    def all_set?(sender)
      self.class.settings.each do |setting|
        set? setting, sender if sender.respond_to? setting
      end
    end

    def settings_recorded?(attributes)
      self.class.settings.sort <=> attributes.sort
    end

    def no_op?(value)
      value == nil
    end

    def no_method?
      begin
        yield
      rescue NoMethodError
        return true
      rescue
        return false
      end
    end
  end
end

class Sender
  include Setter

  attr_accessor :some_setting
  attr_accessor :other_setting
end
