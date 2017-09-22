require 'selenium/webdriver/common/search_context'

module Appium
  module Driver

    module SearchContext

      include Selenium::WebDriver::SearchContext

      FINDERS = {
        accessibility_id: 'accessibility id'
      }.merge!(Selenium::WebDriver::SearchContext::FINDERS)


      class << self
        def add_finder(finder)
          FINDERS.merge!(finder)
        end

      end

      def find_element(*args)
        how, what = extract_args(args)

        by = FINDERS[how.to_sym]
        raise ArgumentError, "cannot find element by #{how.inspect}" unless by

        bridge.find_element_by by, what.to_s, ref
      rescue Selenium::WebDriver::Error::TimeOutError
        raise Selenium::WebDriver::Error::NoSuchElementError
      end

      def find_elements(*args)
        how, what = extract_args(args)

        by = FINDERS[how.to_sym]
        raise ArgumentError, "cannot find elements by #{how.inspect}" unless by

        bridge.find_elements_by by, what.to_s, ref
      rescue Selenium::WebDriver::Error::TimeOutError
        []
      end
    end

  end
end
