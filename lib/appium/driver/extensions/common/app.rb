

module Appium
  module Driver
    module Extensions
      module Common

        module App
          def app_strings(language = nil)
            opts = language ? {language: language} : {}
            bridge.app_strings opts
          end

          def background_app(seconds = 0)
            opts = {seconds: seconds}
            bridge.background_app opts
          end

          def close_app
            bridge.close_app
          end

          def end_coverage(path = nil, intent = nil)
            opts = {}
            opts[:path] = path if path
            opts[:intent] = intent if intent

            bridge.end_coverage opts
          end

          def launch_app
            bridge.launch_app
          end

          def reset
            bridge.reset
          end
        end

      end
    end
  end
end
