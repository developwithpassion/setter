module Settings
  def self.included(base)
    base.extend ClassMethods
  end

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

  module ClassMethods
    def setting(setting)
      attr_accessor setting
      settings << setting
    end

    def settings
      @settings ||= []
    end
  end
end
