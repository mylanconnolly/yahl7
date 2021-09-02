# frozen_string_literal: true

require 'date'

require_relative 'ts'

module YAHL7
  module V2
    class DataType
      # This is the HL7 data type for a name with a date and location.
      class NDL < YAHL7::V2::DataType
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             name: { index: 0, class: YAHL7::V2::DataType::CNN },
                             start_datetime: { index: 1, class: YAHL7::V2::DataType::TS },
                             end_datetime: { index: 2, class: YAHL7::V2::DataType::TS },
                             point_of_care: 3,
                             room: 4,
                             bed: 5,
                             facility: 6,
                             location_status: 7,
                             patient_location_type: 8,
                             building: 9,
                             floor: 10
                           })

        def initialize(value)
          @value = if value.nil?
                     []
                   elsif value.is_a?(String)
                     [value]
                   elsif value[1].is_a?(String)
                     [value]
                   else
                     value
                   end
        end

        def full_name
          name&.full_name
        end

        def bare_name_given_first
          name&.bare_name_given_first
        end

        def bare_name_family_first
          name&.bare_name_family_first
        end
      end
    end
  end
end
