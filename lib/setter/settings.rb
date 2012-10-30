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
        setting_value = options[:default]

        send :define_method, "#{name}=" do |value|
          setting_value = value
        end

        send :define_method, name do
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
