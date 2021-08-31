# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      class OBX < YAHL7::V2::Segment
        include YAHL7::V2::SegmentFieldNames

        define_field_names({
                             set_id: 1,
                             value_type: 2,
                             observation_identifier: 3,
                             observation_sub_id: 4,
                             observation_value: 5,
                             units: 6,
                             reference_range: 7,
                             abnormal_flags: 8,
                             probability: 9,
                             nature_of_abnormal_test: 10,
                             observation_result_status: 11,
                             effective_date_of_reference_range: 12,
                             user_defined_access_checks: 13,
                             observation_datetime: 14,
                             producer_id: 15,
                             responsible_observer: 16,
                             observation_method: 17,
                             equipment_instance_identifier: 18,
                             analysis_datetime: 19
                           })
      end
    end
  end
end
