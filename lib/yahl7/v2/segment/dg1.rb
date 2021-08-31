# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      # DG1 segments contain patient diagnosis information.
      class DG1 < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             set_id: 1,
                             diagnosis_code_method: 2,
                             diagnosis_code: 3,
                             diagnosis_description: 4,
                             diagnosis_datetime: { index: 5, class: YAHL7::V2::DataType::TS },
                             diagnosis_type: 6,
                             major_diagnosis_category: 7,
                             diagnostic_related_group: 8,
                             drg_approval_indicator: 9,
                             drg_grouper_review_code: 10,
                             outlier_type: 11,
                             outlier_days: 12,
                             outlier_cost: 13,
                             grouper_version_and_type: 14,
                             diagnostic_priority: 15,
                             diagnosing_clinician: 16,
                             diagnosis_classification: 17,
                             confidential_indicator: 18,
                             attestation_datetime: { index: 19, class: YAHL7::V2::DataType::TS },
                             diagnosis_identifier: 20,
                             diagnosis_action_code: 21
                           })
      end
    end
  end
end
