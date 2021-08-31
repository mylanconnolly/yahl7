# frozen_string_literal: true

require 'date'

module YAHL7
  module V2
    module DataType
      # This is the HL7 data type for a single date. This should be in the
      # format of YYYY[MM[DD]]
      class DT
        def initialize(value)
          @value = value
        end

        def date
          @date ||= parse_date
        end

        private

        def parse_date
          case @value.length
          when 4 then Date.parse("#{@value}0101")
          when 6 then Date.parse("#{@value}01")
          when 8 then Date.parse(@value)
          else raise YAHL7::V2::Error::InvalidFormatError, 'Unknown date format'
          end
        end
      end
    end
  end
end
