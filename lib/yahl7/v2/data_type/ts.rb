# frozen_string_literal: true

require 'date'

module YAHL7
  module V2
    module DataType
      # This is the HL7 data type for a timestamp with a format of
      # YYYY[MM[DD[HH[MM[SS[.S[S[S[S]]]]]]]]][+/-ZZZZ]
      class TS
        def initialize(value)
          @value = value
        end

        def timestamp
          @timestamp ||= parse_timestamp
        end

        private

        def parse_timestamp
          timestamp = @value.is_a?(Array) ? @value.first : @value
          YAHL7::V2::DateTime.parse(timestamp)
        end
      end
    end
  end
end
