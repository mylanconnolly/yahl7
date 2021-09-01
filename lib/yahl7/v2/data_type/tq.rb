# frozen_string_literal: true

require 'date'

require_relative 'ts'

module YAHL7
  module V2
    class DataType
      # This is the HL7 data type for a timing and quantity.
      class TQ < YAHL7::V2::DataType
        include YAHL7::V2::AliasPersonName
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             quantity: 0,
                             interval: 1,
                             duration: 2,
                             start_datetime: { index: 3, class: YAHL7::V2::DataType::TS },
                             end_datetime: { index: 4, class: YAHL7::V2::DataType::TS },
                             priority: 5,
                             condition: 6,
                             text: 7,
                             conjunction: 8,
                             order_sequencing: 9,
                             occurrence_duration: 10,
                             total_occurrences: 11
                           })
      end
    end
  end
end
