# frozen_string_literal: true

require 'date'

module YAHL7
  module V2
    class DataType
      # This is the HL7 data type for formatted text
      class FT < YAHL7::V2::DataType
        def initialize(value, parse_options)
          @value = value
          @formatter = YAHL7::V2::Formatter.new(parse_options)
        end

        def formatted
          @formatted ||= parse_value
        end

        private

        def parse_value
          value.is_a?(Array) ? value.map { |v| parse_body(v) }.join("\n") : parse_body(value)
        end

        def parse_body(body)
          @formatter.format(body)
        end
      end
    end
  end
end
