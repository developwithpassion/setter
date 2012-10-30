module Settings
  def self.included(base)
    base.extend ClassMethods
  end

  def set(destination, setting=nil)
    set_attributes(destination) unless setting
    set_attribute(destination, setting) if setting
  end

  def set_attributes(destination)
    destination.class.settings.each do |setting|
      set_attribute destination, setting
    end
  end

  def set_attribute(destination, setting)
    destination.send :"#{setting}=", (send setting) if respond_to?(setting)
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
