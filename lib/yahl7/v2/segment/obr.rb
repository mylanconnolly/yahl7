# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      # OBR segments contain observation request information about a patient.
      class OBR < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             set_id: 1,
                             placer_order_number: 2,
                             filler_order_number: 3,
                             universal_service_identifier: 4,
                             priority: 5,
                             requested_datetime: { index: 6, class: YAHL7::V2::DataType::TS },
                             observation_datetime: { index: 7, class: YAHL7::V2::DataType::TS },
                             observation_end_datetime: { index: 8, class: YAHL7::V2::DataType::TS },
                             collection_volume: 9,
                             collector_identifier: 10,
                             specimen_action_code: 11,
                             danger_code: 12,
                             relevant_clinical_information: 13,
                             specimen_received_datetime: { index: 14, class: YAHL7::V2::DataType::TS },
                             specimen_source: 15,
                             ordering_provider: 16,
                             order_callback_phone_number: { index: 17, class: YAHL7::V2::DataType::XTN },
                             placer_field1: 18,
                             placer_field2: 19,
                             filler_field1: 20,
                             filler_field2: 21,
                             result_report_datetime: { index: 22, class: YAHL7::V2::DataType::TS },
                             charge_to_practice: 23,
                             diagnostic_service_section_id: 24,
                             result_status: 25,
                             parent_result: 26,
                             quantity_timing: { index: 27, class: YAHL7::V2::DataType::TQ },
                             result_copies_to: 28,
                             parent: 29,
                             transportation_mode: 30,
                             reason_for_study: 31,
                             principal_result_interpreter: { index: 32, class: YAHL7::V2::DataType::NDL },
                             assistant_result_interpreter: { index: 33, class: YAHL7::V2::DataType::NDL },
                             technician: { index: 34, class: YAHL7::V2::DataType::NDL },
                             transcriptionist: { index: 35, class: YAHL7::V2::DataType::NDL },
                             scheduled_datetime: { index: 36, class: YAHL7::V2::DataType::TS },
                             number_of_sample_containers: 37,
                             transport_logistics_collected_samples: 38,
                             collector_comment: 39,
                             transport_arrangement_responsibility: 40,
                             transport_arranged: 41,
                             escort_required: 42,
                             planned_patient_transport_comment: 43,
                             procedure_code: 44,
                             procedure_code_modifier: 45,
                             placer_supplemental_service_identification: 46,
                             filler_supplemental_service_identification: 47,
                             medically_necessary_duplicate_procedure_reason: 48,
                             result_handling: 49
                           })
      end
    end
  end
end
