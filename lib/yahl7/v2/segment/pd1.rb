# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      class PD1 < YAHL7::V2::Segment
        include YAHL7::V2::SegmentFieldNames

        define_field_names({
                             living_dependency: 1,
                             living_arrangement: 2,
                             patient_primary_facility: 3,
                             patient_primary_care_provider: 4,
                             student_indicator: 5,
                             handicap: 6,
                             living_will_code: 7,
                             organ_donor_code: 8,
                             separate_bill: 9,
                             duplicate_patient: 10,
                             publicity_code: 11,
                             protection_indicator: 12,
                             protection_indicator_effective_date: 13,
                             place_of_worship: 14,
                             advance_directive_code: 15,
                             immunization_registry_status: 16,
                             immunization_registry_status_effective_date: 17,
                             publicity_code_effective_date: 18,
                             military_branch: 19,
                             military_rank_grade: 20,
                             military_status: 21
                           })
      end
    end
  end
end
