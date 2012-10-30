module Setter
  module Settings
    def self.included(base)
      base.extend ClassMethods
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
end
