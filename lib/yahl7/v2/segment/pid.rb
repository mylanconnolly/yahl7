# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      class PID < YAHL7::V2::Segment
        include YAHL7::V2::SegmentFieldNames

        define_field_names({
                             set_id: 1,
                             patient_id: 2,
                             patient_identifier_list: 3,
                             alternate_patient_id: 4,
                             patient_name: 5,
                             mothers_maiden_name: 6,
                             datetime_of_birth: 7,
                             administrative_sex: 8,
                             patient_alias: 9,
                             patient_race: 10,
                             patient_address: 11,
                             country_code: 12,
                             phone_number_home: 13,
                             phone_number_business: 14,
                             primary_language: 15,
                             marital_status: 16,
                             religion: 17,
                             patient_account_number: 18,
                             patient_ssn_number: 19,
                             patient_drivers_license_number: 20,
                             mother_identifier: 21,
                             ethnic_group: 22,
                             birthplace: 23,
                             multiple_birth_indicator: 24,
                             birth_order: 25,
                             citizenship: 26,
                             veteran_military_service: 27,
                             nationality: 28,
                             patient_death_datetime: 29,
                             patient_death_indicator: 30,
                             identity_unknown_indicator: 31,
                             identity_reliability_code: 32,
                             last_update_datetime: 33,
                             last_update_facility: 34,
                             species_code: 35,
                             breed_code: 36,
                             strain: 37,
                             production_class_code: 38,
                             tribal_citizenship: 39
                           })
      end
    end
  end
end
