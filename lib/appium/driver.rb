require 'appium/driver/uiautomator2'

module Appium
  module Driver

    class << self
      def for(type, **args)
        case type
        when :uiautomator2
          return Appium::Driver::UIAutomator2.new(**args)
        else
          raise ArgumentError, "unknown type: #{ type }"
        end
      end
    end

  end
end
