# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      class OBR < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             set_id: 1,
                             placer_order_number: 2,
                             filler_order_number: 3,
                             universal_service_identifier: 4,
                             priority: 5,
                             requested_datetime: 6,
                             observation_datetime: 7,
                             observation_end_datetime: 8,
                             collection_volume: 9,
                             collector_identifier: 10,
                             specimen_action_code: 11,
                             danger_code: 12,
                             relevant_clinical_information: 13,
                             specimen_received_datetime: 14,
                             specimen_source: 15,
                             ordering_provider: 16,
                             order_callback_phone_number: 17,
                             placer_field1: 18,
                             placer_field2: 19,
                             filler_field1: 20,
                             filler_field2: 21,
                             result_report_datetime: 22,
                             charge_to_practice: 23,
                             diagnostic_service_section_id: 24,
                             result_status: 25,
                             parent_result: 26,
                             quantity_timing: 27,
                             result_copies_to: 28,
                             parent: 29,
                             transportation_mode: 30,
                             reason_for_study: 31,
                             principal_result_interpreter: 32,
                             assistant_result_interpreter: 33,
                             technician: 34,
                             transcriptionist: 35,
                             scheduled_datetime: 36,
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
