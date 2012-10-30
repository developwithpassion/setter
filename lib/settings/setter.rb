module Settings
  module Setter
    def set(receiver, setting=nil)
      set_attributes(receiver) unless setting
      set_attribute(receiver, setting) if setting
    end

    def set_attributes(receiver)
      receiver.class.settings.each do |setting|
        set_attribute receiver, setting
      end
    end

    def set_attribute(receiver, setting)
      receiver.send :"#{setting}=", (send setting) if respond_to?(setting)
    end
  end
end
