# frozen_string_literal: true

require 'date'

module YAHL7
  module V2
    module DataType
      # This is the HL7 data type for a name with a date and location.
      class NDL
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             name: 0,
                             start_datetime: 1,
                             end_datetime: 2,
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
          @value = value
        end
      end
    end
  end
end
