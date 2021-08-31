# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      class EVN < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             event_type_code: 1,
                             recorded_datetime: { index: 2, class: YAHL7::V2::DataType::TS },
                             planned_event_datetime: { index: 3, class: YAHL7::V2::DataType::TS },
                             event_reason_code: 4,
                             operator_id: 5,
                             event_occurred: { index: 6, class: YAHL7::V2::DataType::TS },
                             event_facility: 7
                           })
      end
    end
  end
end
