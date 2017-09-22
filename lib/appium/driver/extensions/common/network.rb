

module Appium
  module Driver
    module Extensions
      module Common

        module Network

          # Value (Alias)      | Data | Wifi | Airplane Mode
          #   -------------------------------------------------
          #   1 (Airplane Mode)  | 0    | 0    | 1
          #   6 (All network on) | 1    | 1    | 0
          #   4 (Data only)      | 1    | 0    | 0
          #   2 (Wifi only)      | 0    | 1    | 0
          #   0 (None)           | 0    | 0    | 0

          def get_network
            bridge.network_connection
          end

          def set_network(type)
            opts = {type: type}

            bridge.set_network_connection opts
          end

        end
      end
    end
  end
end
