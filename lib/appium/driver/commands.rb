# Protocol - https://github.com/appium/appium-base-driver/blob/master/docs/mjsonwp/protocol-methods.md

require 'selenium/webdriver/remote/commands'

module Appium
  module Driver
    module Commands

      APPIUM_SPECIFIC_COMMANDS = {

        #
        # Appium (app)
        #
        app_strings: {
          end_point: [:post, 'session/:session_id/appium/app/strings'],
          params: {
            language: nil
          }
        },
        background_app: {
          end_point: [:post, 'session/:session_id/appium/app/background'],
          params: {
            seconds: 0
          }
        },
        close_app: {
          end_point: [:post, 'session/:session_id/appium/app/close'],
          params: nil
        },
        end_coverage: {
          end_point: [:post, 'session/:session_id/appium/app/end_test_coverage'],
          params: {
            path: nil,
            intent: nil
          }
        },
        launch_app: {
          end_point: [:post, 'session/:session_id/appium/app/launch'],
          params: nil
        },
        reset: {
          end_point: [:post, 'session/:session_id/appium/app/reset'],
          params: nil
        },

        #
        # Appium (device)
        #
        app_installed?: {
          end_point: [:post, 'session/:session_id/appium/device/app_installed'],
          params: {
            bundleId: nil
          }
        },
        current_activity: {
          end_point: [:get,  'session/:session_id/appium/device/current_activity'],
          params: nil
        },
        device_locked?: {
          end_point: [:post, 'session/:session_id/appium/device/is_locked'],
          params: nil
        },
        device_time: {
          end_point: [:get,  'session/:session_id/appium/device/system_time'],
          params: nil
        },
        display_density: {
          end_point: [:get,  'session/:session_id/appium/device/display_density'],
          params: nil
        },
        hide_keyboard: {
          end_point: [:post, 'session/:session_id/appium/device/hide_keyboard'],
          params: {
            strategy: :tapOutside,
            key: nil
          }
        },
        install_app: {
          end_point: [:post, 'session/:session_id/appium/device/install_app'],
          params: {
            appPath: nil
          }
        },
        keyboard_shown?: {
          end_point: [:get,  'session/:session_id/appium/device/is_keyboard_shown'],
          params: nil
        },
        lock: {
          end_point: [:post, 'session/:session_id/appium/device/lock'],
          params: {
            seconds: 1
          }
        },
        long_press_keycode: {
          end_point: [:post, 'session/:session_id/appium/device/long_press_keycode'],
          params: {
            keycode: nil,
            metastate: nil
          }
        },
        open_notifications: {
          end_point: [:post, 'session/:session_id/appium/device/open_notifications'],
          params: nil
        },
        press_keycode: {
          end_point: [:post, 'session/:session_id/appium/device/press_keycode'],
          params: {
            keycode: nil,
            metastate: nil
          }
        },
        pull_file: {
          end_point: [:post, 'session/:session_id/appium/device/pull_file'],
          params: {
            path: nil
          }
        },
        pull_folder: {
          end_point: [:post, 'session/:session_id/appium/device/pull_folder'],
          params: {
            path: nil
          }
        },
        push_file: {
          end_point: [:post, 'session/:session_id/appium/device/push_file'],
          params: {
            path: nil,
            data: nil
          }
        },
        remove_app: {
          end_point: [:post, 'session/:session_id/appium/device/remove_app'],
          params: {
            appId: nil
          }
        },
        shake: {
          end_point: [:post, 'session/:session_id/appium/device/shake'],
          params: nil
        },
        start_activity: {
          end_point: [:post, 'session/:session_id/appium/device/start_activity'],
          params: {
            appPackage: nil,
            appActivity: nil,
            appWaitPackage: nil,
            appWaitActivity: nil
          }
        },
        system_bars: {
          end_point: [:get,  'session/:session_id/appium/device/system_bars'],
          params: nil
        },
        toggle_airplane_mode: {
          end_point: [:post, 'session/:session_id/appium/device/toggle_airplane_mode'],
          params: nil
        },

        #
        # Appium (element)
        #
        set_immediate_value: {
          end_point: [:post, 'session/:session_id/appium/element/:id/value'],
          params: {
            id: nil,
            value: nil
          }
        },

        #
        # Appium (performance)
        #
        performance_data: {
          end_point: [:post, 'session/:session_id/appium/getPerformanceData'],
          params: {
            packageName: nil,
            dataType: nil,
            dataReadTimeout: 1000
          }
        },
        performance_data_types: {
          end_point: [:post, 'session/:session_id/appium/performanceData/types'],
          params: nil
        },

        #
        # Appium (settings)
        #
        settings: {
          end_point: [:get,  'session/:session_id/appium/settings'],
          params: nil
        },
        update_settings: {
          end_point: [:post, 'session/:session_id/appium/settings'],
          params: {
            settings: nil
          }
        },

        #
        # Appium (simulator)
        #
        touch_id: {
          end_point: [:post, 'session/:session_id/appium/simulator/touch_id'],
          params: {
            match: false
          }
        },
        toggle_touch_id_enrollment: {
          end_point: [:post, 'session/:session_id/appium/simulator/toggle_touch_id_enrollment'],
          params: nil
        },

        #
        # Context
        #
        available_contexts: {
          end_point: [:get,  'session/:session_id/contexts'],
          params: nil
        },
        current_context: {
          end_point: [:get,  'session/:session_id/context'],
          params: nil
        },
        set_context: {
          end_point: [:post, 'session/:session_id/context'],
          params: {
            name: nil
          }
        },

        #
        # Network
        #
        network_connection: {
          end_point: [:get,  'session/:session_id/network_connection'],
          params: nil
        },
        set_network_connection: {
          end_point: [:post, 'session/:session_id/network_connection'],
          params: {
            type: nil
          }
        },

        #
        # Touch
        #
        multi_perform: {
          end_point: [:post, 'session/:session_id/touch/multi/perform'],
          params: {
            actions: nil
          }
        },
        perform: {
          end_point: [:post, 'session/:session_id/touch/perform'],
          params: {
            actions: nil
          }
        },

      }

      APPIUM_COMMANDS = {}.merge!(Selenium::WebDriver::Remote::Bridge::COMMANDS)
      APPIUM_COMMANDS.merge!(Hash[APPIUM_SPECIFIC_COMMANDS.map {|k, v| [k, v[:end_point]]}])
    end
  end
end
