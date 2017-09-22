require 'selenium/webdriver/common/target_locator'

require 'appium/driver/bridge'
require 'appium/driver/search_context'
require 'appium/driver/extensions'
require 'appium/driver/helpers'

module Appium
  module Driver

    class Base

      include SearchContext
      include Helpers

      include Extensions::Common

      include ::Selenium::WebDriver::DriverExtensions::HasLocation
      include ::Selenium::WebDriver::DriverExtensions::HasNetworkConnection
      include ::Selenium::WebDriver::DriverExtensions::HasRemoteStatus
      include ::Selenium::WebDriver::DriverExtensions::HasSessionId
      include ::Selenium::WebDriver::DriverExtensions::HasTouchScreen
      include ::Selenium::WebDriver::DriverExtensions::Rotatable
      include ::Selenium::WebDriver::DriverExtensions::TakesScreenshot

      attr_reader :bridge

      def initialize(**opts)
        default_opts = {
          url: 'http://localhost:4723/wd/hub',
          http_client: ::Selenium::WebDriver::Remote::Http::Default.new(open_timeout: 999_999, read_timeout: 999_999)
        }
        caps = opts.delete(:desired_capabilities).merge!(
          {
            javascript_enabled: true,
            takes_screenshot: true,
            css_selectors_enabled: true
          })
        opts[:desired_capabilities] = ::Selenium::WebDriver::Remote::Capabilities.new(caps)

        @bridge = Bridge.new(default_opts.merge!(opts))

        extend(*extensions) unless extensions.empty?

        # MonkeyPatch selenium element with appium searchcontext
        Selenium::WebDriver::Element.include SearchContext
      end

      def switch_to
        @switch_to ||= ::Selenium::WebDriver::TargetLocator.new(bridge)
      end

      def navigate
        @navigate ||= ::Selenium::WebDriver::Navigation.new(bridge)
      end

      def manage
        bridge.options
      end

      def action
        bridge.action
      end

      def mouse
        bridge.mouse
      end

      def keyboard
        bridge.keyboard
      end

      def get(url)
        navigate.to(url)
      end

      def current_url
        bridge.url
      end

      def title
        bridge.title
      end

      def page_source
        bridge.page_source
      end

      def quit
        bridge.quit
      end

      def close
        bridge.close
      end

      def window_handles
        bridge.window_handles
      end

      def window_handle
        bridge.window_handle
      end

      def execute_script(script, *args)
        bridge.execute_script(script, *args)
      end

      def execute_async_script(script, *args)
        bridge.execute_async_script(script, *args)
      end

      def browser
        bridge.browser
      end

      def capabilities
        bridge.session_capabilities
      end

      alias_method :first, :find_element
      alias_method :all, :find_elements
      alias_method :script, :execute_script

      def ref
        nil
      end

    end
  end
end
