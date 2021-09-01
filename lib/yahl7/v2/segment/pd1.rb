# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      # PD1 segments contain additional patient demographic information.
      class PD1 < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             living_dependency: 1,
                             living_arrangement: 2,
                             patient_primary_facility: 3,
                             patient_primary_care_provider: { index: 4, class: YAHL7::V2::DataType::XCN },
                             student_indicator: 5,
                             handicap: 6,
                             living_will_code: 7,
                             organ_donor_code: 8,
                             separate_bill: 9,
                             duplicate_patient: 10,
                             publicity_code: 11,
                             protection_indicator: 12,
                             protection_indicator_effective_date: { index: 13, class: YAHL7::V2::DataType::DT },
                             place_of_worship: 14,
                             advance_directive_code: 15,
                             immunization_registry_status: 16,
                             immunization_registry_status_effective_date: { index: 17, class: YAHL7::V2::DataType::DT },
                             publicity_code_effective_date: { index: 18, class: YAHL7::V2::DataType::DT },
                             military_branch: 19,
                             military_rank_grade: 20,
                             military_status: 21
                           })
      end
    end
  end
end
