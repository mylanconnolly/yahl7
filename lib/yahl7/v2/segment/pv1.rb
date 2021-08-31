# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      # PV1 segments contain information about the patient visit.
      class PV1 < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             set_id: 1,
                             patient_class: 2,
                             assigned_patient_location: 3,
                             admission_type: 4,
                             preadmit_number: 5,
                             prior_patient_location: 6,
                             attending_doctor: 7,
                             referring_doctor: 8,
                             consulting_doctor: 9,
                             hospital_service: 10,
                             temporary_location: 11,
                             preadmit_test_indicator: 12,
                             readmission_indicator: 13,
                             admit_source: 14,
                             ambulatory_status: 15,
                             vip_indicator: 16,
                             admitting_doctor: 17,
                             patient_type: 18,
                             visit_number: 19,
                             financial_class: 20,
                             charge_price_indicator: 21,
                             courtesy_code: 22,
                             credit_rating: 23,
                             contract_code: 24,
                             contract_effective_date: { index: 25, class: YAHL7::V2::DataType::DT },
                             contract_amount: 26,
                             contract_period: 27,
                             interest_code: 28,
                             transfer_to_bad_debt_code: 29,
                             transfer_to_bad_debt_date: { index: 30, class: YAHL7::V2::DataType::DT },
                             bad_debt_agency_code: 31,
                             bad_debt_transfer_amount: 32,
                             bad_debt_recovery_amount: 33,
                             delete_account_indicator: 34,
                             delete_account_date: { index: 35, class: YAHL7::V2::DataType::DT },
                             discharge_disposition: 36,
                             discharged_to_location: 37,
                             diet_type: 38,
                             servicing_facility: 39,
                             bed_status: 40,
                             account_status: 41,
                             pending_location: 42,
                             prior_temporary_location: 43,
                             admit_datetime: { index: 44, class: YAHL7::V2::DataType::TS },
                             discharge_datetime: { index: 45, class: YAHL7::V2::DataType::TS },
                             current_patient_balance: 46,
                             total_charges: 47,
                             total_adjustments: 48,
                             total_payouts: 49,
                             alternate_visit_id: 50,
                             visit_indicator: 51,
                             other_healthcare_provider: 52
                           })
      end
    end
  end
end
