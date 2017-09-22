require 'selenium/webdriver/remote/bridge'

require 'appium/driver/commands'

module Appium
  module Driver

    class Bridge < Selenium::WebDriver::Remote::Bridge

      def commands(command)
        Commands::APPIUM_COMMANDS[command]
      end

      Commands::APPIUM_SPECIFIC_COMMANDS.keys.each do |command|
        params = Commands::APPIUM_SPECIFIC_COMMANDS[command][:params]

        if params
          define_method(command) do |**opts|
            execute command, {}, params.merge(opts)
          end
        else
          define_method(command) do
            execute command
          end
        end
      end

    end
  end
end
