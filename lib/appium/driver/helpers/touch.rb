require 'nokogiri'

module Appium
  module Driver
    module Helpers
      module Touch

        def swipe(opts)
          start_x  = opts.fetch :start_x, 0
          start_y  = opts.fetch :start_y, 0
          end_x    = opts.fetch :end_x, nil
          end_y    = opts.fetch :end_y, nil
          duration = opts.fetch :duration, 200

          ta = TouchAction.new
          ta.press x: start_x, y: start_y
          ta.wait(duration) if duration
          ta.move_to x: end_x, y: end_y
          ta.release

          perform(ta.actions)
        end

        class TouchAction
          ACTIONS = %i(move_to long_press double_tap two_finger_tap press release tap wait perform)

          attr_reader :actions

          def initialize
            @actions = []
          end

          def move_to(opts)
            opts = args_with_ele_ref(opts)
            chain_method(:moveTo, opts)
          end

          def long_press(opts)
            args = opts.select { |k, _v| [:element, :x, :y, :duration].include? k }
            args = args_with_ele_ref(args)
            chain_method(:longPress, args) # longPress is what the appium server expects
          end

          def press(opts)
            args = opts.select { |k, _v| [:element, :x, :y].include? k }
            args = args_with_ele_ref(args)
            chain_method(:press, args)
          end

          def release(opts = nil)
            args = args_with_ele_ref(opts) if opts
            chain_method(:release, args)
          end

          def tap(opts)
            opts[:count] = opts.delete(:fingers) if opts[:fingers]
            opts[:count] ||= 1
            args = args_with_ele_ref opts
            chain_method(:tap, args)
          end

          def double_tap(opts)
            args = opts.select { |k, _v| [:element, :x, :y].include? k }
            args = args_with_ele_ref(args)
            chain_method(:doubleTap, args)
          end

          def two_finger_tap(opts)
            args = opts.select { |k, _v| [:element, :x, :y].include? k }
            args = args_with_ele_ref(args)
            chain_method(:twoFingerTap, args)
          end

          def wait(milliseconds)
            args = { ms: milliseconds }
            chain_method(:wait, args)
          end

          private

          def chain_method(method, args = nil)
            action = args ? { action: method, options: args } : { action: method }
            @actions << action
            self
          end

          def args_with_ele_ref(args)
            args[:element] = args[:element].ref if args.key? :element
            args
          end

        end
      end
    end
  end
end
