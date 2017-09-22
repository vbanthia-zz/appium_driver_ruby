

module Appium
  module Driver
    module Extensions
      module Common

        module Device
          def app_installed?(bundleId = nil)
            opts = bundleId ? {bundleId: bundleId} : {}
            bridge.app_installed? opts
          end

          def current_activity
            bridge.current_activity
          end

          def device_locked?
            bridge.device_locked?
          end

          def device_time
            bridge.device_time
          end

          def display_density
            bridge.display_density
          end

          ## TODO: change for ios
          def hide_keyboard(strategy = :tapOutside, key = nil)
            opts = {}
            opts[:strategy] = strategy if strategy
            opts[:key] = key if key

            bridge.hide_keyboard opts
          end

          def install_app(app_path)
            raise ArgumentError, "#{ appPath }  is not valid" unless File.exists? app_path
            opts = {appPath: app_path}

            bridge.install_app opts
          end

          def keyboard_shown?
            bridge.keyboard_shown?
          end

          def lock(seconds = 1)
            opts = {seconds: seconds}

            bridge.lock opts
          end

          def long_press_keycode(keycode = nil, metastate = nil)
            opts = {}
            opts[:keycode] = keycode if keycode
            opts[:metastate] = metastate if metastate

            bridge.long_press_keycode opts
          end

          def open_notifications
            bridge.open_notifications
          end

          def press_keycode(keycode = nil, metastate = nil)
            opts = {}
            opts[:keycode] = keycode if keycode
            opts[:metastate] = metastate if metastate

            bridge.press_keycode opts
          end

          def pull_file(path)
            opts = {path: path}

            bridge.pull_file opts
          end

          def pull_folder(path)
            opts = {path: path}

            bridge.pull_folder opts
          end

          def push_file(path, data)
            opts = {path: path, data: data}

            bridge.push_file opts
          end

          ## TODO: fix it
          ## Parameters were incorrect. We wanted {"required":[["appId"],["bundleId"]]} and you sent ["appId","bundleId"]
          def remove_app(appId)
            opts = {appId: appId}

            bridge.remove_app opts
          end

          def shake
            bridge.shake
          end

          def start_activity(app_package = nil, app_activity = nil, app_wait_package = nil, app_wait_activity = nil)
            opts = {}
            opts[:appPackage] = app_package if app_package
            opts[:appActivity] = app_activity if app_activity
            opts[:appWaitPackage] = app_wait_package if app_wait_package
            opts[:appWaitActivity] = app_wait_activity if app_wait_activity

            bridge.start_activity opts
          end

          def system_bars
            bridge.system_bars
          end

          def toggle_airplane_mode
            bridge.toggle_airplane_mode
          end
        end

      end
    end
  end
end
