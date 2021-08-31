# frozen_string_literal: true

require 'date'

module YAHL7
  module V2
    class DataType
      # This is the HL7 data type for an extended address.
      class XAD < YAHL7::V2::DataType
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             street_address: 0,
                             other_designation: 1,
                             city: 2,
                             state: 3,
                             zip: 4,
                             country: 5,
                             address_type: 6,
                             other_geographic_designation: 7,
                             county_code: 8,
                             census_tract: 9,
                             address_representation_code: 10,
                             address_validity_range: 11,
                             effective_date: { index: 12, class: YAHL7::V2::DataType::TS },
                             expiration_date: { index: 13, class: YAHL7::V2::DataType::TS }
                           })
      end
    end
  end
end
