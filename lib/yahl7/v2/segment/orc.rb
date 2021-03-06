# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      # ORC segments contain information common to all orders.
      class ORC < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             order_control: 1,
                             placer_order_number: 2,
                             filler_order_number: 3,
                             placer_group_number: 4,
                             order_status: 5,
                             response_flag: 6,
                             quantity_timing: { index: 7, class: YAHL7::V2::DataType::TQ },
                             parent_order: 8,
                             transaction_datetime: 9,
                             entered_by: { index: 10, class: YAHL7::V2::DataType::XCN },
                             verified_by: { index: 11, class: YAHL7::V2::DataType::XCN },
                             ordering_provider: { index: 12, class: YAHL7::V2::DataType::XCN },
                             enterer_location: 13,
                             callback_phone_number: { index: 14, class: YAHL7::V2::DataType::XTN },
                             order_effective_datetime: { index: 15, class: YAHL7::V2::DataType::TS },
                             order_control_code_reason: 16,
                             entering_organization: 17,
                             entering_device: 18,
                             action_by: { index: 19, class: YAHL7::V2::DataType::XCN },
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
