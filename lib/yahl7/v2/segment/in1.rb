# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      class IN1 < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             set_id: 1,
                             insurance_plan_id: 2,
                             insurance_company_id: 3,
                             insurance_company_name: 4,
                             insurance_company_address: { index: 5, class: YAHL7::V2::DataType::XAD },
                             insurance_company_contact_person: { index: 6, class: YAHL7::V2::DataType::XPN },
                             insurance_company_contact_number: { index: 7, class: YAHL7::V2::DataType::XTN },
                             group_number: 8,
                             group_name: 9,
                             insured_group_employee_id: 10,
                             insured_group_employee_name: 11,
                             plan_effective_date: { index: 12, class: YAHL7::V2::DataType::DT },
                             plan_expiration_date: { index: 13, class: YAHL7::V2::DataType::DT },
                             authorization_information: 14,
                             plan_type: 15,
                             insured_name: { index: 16, class: YAHL7::V2::DataType::XPN },
                             insured_relationship_to_patient: 17,
                             insured_date_of_birth: 18,
                             insured_address: { index: 19, class: YAHL7::V2::DataType::XAD },
                             assignment_of_benefits: 20,
                             coordination_of_benefits: 21,
                             coordination_of_benefit_priority: 22,
                             notice_of_admission_flag: 23,
                             notice_of_admission_date: { index: 24, class: YAHL7::V2::DataType::DT },
                             report_of_eligibility_flag: 25,
                             report_of_eligibility_date: { index: 26, class: YAHL7::V2::DataType::DT },
                             release_information_code: 27,
                             preadmit_certification: 28,
                             verification_datetime: 29,
                             verification_by: 30,
                             type_of_agreement_code: 31,
                             billing_status: 32,
                             lifetime_reserve_days: 33,
                             delay_before_lifetime_reserve_days: 34,
                             company_plan_code: 35,
                             policy_number: 36,
                             policy_deductible: 37,
                             policy_limit_amount: 38,
                             policy_limit_days: 39,
                             room_rate_semi_private: 40,
                             room_rate_private: 41,
                             insured_employment_status: 42,
                             insured_administrative_sex: 43,
                             insured_employer_address: { index: 44, class: YAHL7::V2::DataType::XAD },
                             verification_status: 45,
                             prior_insurance_plan_id: 46,
                             coverage_type: 47,
                             handicap: 48,
                             insured_id_number: 49,
                             signature_code: 50,
                             signature_code_date: { index: 51, class: YAHL7::V2::DataType::DT },
                             insured_birth_place: 52,
                             vip_indicator: 53
                           })
      end
    end
  end
end
