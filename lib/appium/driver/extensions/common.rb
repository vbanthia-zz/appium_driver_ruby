

require 'appium/driver/extensions/common/app'
require 'appium/driver/extensions/common/context'
require 'appium/driver/extensions/common/device'
require 'appium/driver/extensions/common/touch'
require 'appium/driver/extensions/common/network'

module Appium
  module Driver
    module Extensions
      module Common

        include App
        include Context
        include Device
        include Touch
        include Network

      end
    end
  end
end
