

module Appium
  module Driver
    module Extensions
      module Common

        module Context
          def available_contexts
            bridge.available_contexts
          end

          def current_context
            bridge.current_context
          end

          def set_context(context)
            opts = {name: context}

            bridge.set_context opts
          end

        end
      end
    end
  end
end
