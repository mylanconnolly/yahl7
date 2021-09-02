# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      # OBX segments contain observation result information.
      class OBX < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             set_id: 1,
                             value_type: 2,
                             observation_identifier: 3,
                             observation_sub_id: 4,
                             observation_value: { index: 5, class: YAHL7::V2::DataType::FT },
                             units: 6,
                             reference_range: 7,
                             abnormal_flags: 8,
                             probability: 9,
                             nature_of_abnormal_test: 10,
                             observation_result_status: 11,
                             effective_date_of_reference_range: { index: 12, class: YAHL7::V2::DataType::TS },
                             user_defined_access_checks: 13,
                             observation_datetime: { index: 14, class: YAHL7::V2::DataType::TS },
                             producer_id: 15,
                             responsible_observer: { index: 16, class: YAHL7::V2::DataType::XCN },
                             observation_method: 17,
                             equipment_instance_identifier: 18,
                             analysis_datetime: { index: 19, class: YAHL7::V2::DataType::TS }
                           })
      end
    end
  end
end
