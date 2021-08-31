# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      class ORC < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             order_control: 1,
                             placer_order_number: 2,
                             filler_order_number: 3,
                             placer_group_number: 4,
                             order_status: 5,
                             response_flag: 6,
                             quantity_timing: 7,
                             parent_order: 8,
                             transaction_datetime: 9,
                             entered_by: 10,
                             verified_by: 11,
                             ordering_provider: 12,
                             enterer_location: 13,
                             callback_phone_number: { index: 14, class: YAHL7::V2::DataType::XTN },
                             order_effective_datetime: { index: 15, class: YAHL7::V2::DataType::TS },
                             order_control_code_reason: 16,
                             entering_organization: 17,
                             entering_device: 18,
                             action_by: 19,
                             advanced_beneficiary_notice_code: 20,
                             ordering_facility_name: 21,
                             ordering_facility_address: { index: 22, class: YAHL7::V2::DataType::XAD },
                             ordering_facility_phone_number: { index: 23, class: YAHL7::V2::DataType::XTN },
                             ordering_provider_address: { index: 24, class: YAHL7::V2::DataType::XAD },
                             order_status_modifier: 25,
                             advanced_beneficiary_notice_override_reason: 26,
                             filler_expected_availability_datetime: { index: 27, class: YAHL7::V2::DataType::TS },
                             confidentiality_code: 28,
                             order_type: 29,
                             enterer_authorization_code: 30
                           })
      end
    end
  end
end
