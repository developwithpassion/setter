module Settings
  def self.included(base)
    base.extend ClassMethods
  end

  def self.set(source, destination)
    destination.class.instance_eval do
      @list_of_settings.each do |setting|
        if source.respond_to? setting
          destination.send :"#{setting.to_s}=", (source.send setting)
        end
      end unless not @list_of_settings
    end
  end

  module ClassMethods
    def setting(setting_name)
      send :define_method, :"#{setting_name.to_s}=" do |value|
        instance_variable_set "@#{setting_name.to_s}", value
      end

      send :define_method, setting_name do
        instance_variable_get "@#{setting_name.to_s}"
      end

      self.instance_eval do
        @list_of_settings ||= []
        @list_of_settings << setting_name
      end
    end
  end
end