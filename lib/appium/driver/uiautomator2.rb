require 'appium/driver/base'
require 'appium/driver/search_context'

module Appium
  module Driver

    class UIAutomator2 < Base

      def initialize(**opts)
        default_capabilities = {
          platformName: 'Android',
          automationName: 'uiautomator2'
        }

        raise 'Add desired_capabilities' unless opts[:desired_capabilities]
        opts[:desired_capabilities].merge!(default_capabilities)

        SearchContext.add_finder({uiautomator: '-android uiautomator'})
        super(opts)
      end

      def extensions
        [
          Extensions::UIAutomator2
        ]
      end

    end
  end
end
