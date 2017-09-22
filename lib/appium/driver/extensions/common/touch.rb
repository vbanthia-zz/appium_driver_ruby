

module Appium
  module Driver
    module Extensions
      module Common

        module Touch

          def perform(actions)
            opts = {actions: actions}

            bridge.perform opts
          end

          def multi_perform(actions)
            opts = {actions: actions}

            bridge.multi_perform opts
          end
        end
      end
    end
  end
end
