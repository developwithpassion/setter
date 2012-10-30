module Settings
  def self.included(base)
    base.extend ClassMethods
  end

  def set(destination, name=nil)
    if not name
      me = self
      destination.class.instance_eval do
        @__settings.each do |setting|
          if me.respond_to? setting
            me.set_attribute destination, setting
          end
        end unless not @__settings
      end
    else
      set_attribute destination, name
    end
  end

  def set_attribute(destination, name)
    destination.send :"#{name.to_s}=", (send name)
  end

  module ClassMethods
    def setting(setting_name)
      attr_accessor setting_name

      self.instance_eval do
        @__settings ||= []
        @__settings << setting_name
      end
    end

    def settings
      @__settings
    end

  def set(source, destination)
    destination.class.instance_eval do
      @__settings.each do |setting|
        if source.respond_to? setting
          set_attribute destination, setting
        end
      end unless not @__settings
    end
  end


  end
end
