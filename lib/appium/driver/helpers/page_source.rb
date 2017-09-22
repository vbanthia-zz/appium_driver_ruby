require 'nokogiri'

module Appium
  module Driver
    module Helpers
      module PageSource

        class AndroidElements < Nokogiri::XML::SAX::Document
          attr_reader :result, :keys, :filter

          def filter=(value)
            return @filter = false unless value
            @filter = value.to_s.downcase
          end

          def initialize
            reset
            @filter = false
          end

          def reset
            @result = ''
            @keys = %w(text resource-id content-desc)
          end

          def start_element(name, attrs = [])
            return if filter && !name.downcase.include?(filter)

            attributes = {}

            attrs.each do |key, value|
              attributes[key] = value if keys.include?(key) && !value.empty?
            end

            attributes_values = attributes.values

            string = ''
            text = attributes['text']
            desc = attributes['content-desc']
            id = attributes['resource-id']

            if !text.nil? && text == desc
              string << "  text, desc: #{text}\n"
            else
              string << "  text: #{text}\n" unless text.nil?
              string << "  desc: #{desc}\n" unless desc.nil?
            end
            string << "  id: #{id}\n" unless id.nil?

            @result += "\n#{name}\n#{string}" unless attributes.empty?
          end
        end

        def inspect_page(class_name = false)
          source = page_source

          doctype_string = '<!doctyp'
          source_header  = source[0..doctype_string.length].downcase
          source_is_html = source_header.start_with?(doctype_string, '<html')

          parser = Nokogiri::XML::SAX::Parser.new(AndroidElements.new)
          parser.document.reset
          parser.document.filter = class_name
          parser.parse source
          result = parser.document.result
          parser.document.reset
          puts result
        end

      end
    end
  end
end
