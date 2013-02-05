require 'null_object'

module Setter
  module Settings

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def null_object(implementation)
        null_object_options = {}
        implementation.instance_methods.each do |instance_method|
          null_object_options[instance_method] = nil
        end
        NullObject.new null_object_options
      end

      def setting(name, options={})
        setting_value = nil
        setting_value = options[:default] if (options.is_a? Hash) && options.has_key?(:default)
        setting_value ||= options

        define_method "#{name}=" do |value|
          setting_value = value
        end

        define_method name do
          setting_value
        end

        settings << name
      end

      def settings
        @settings ||= []
      end
    end
  end
end
