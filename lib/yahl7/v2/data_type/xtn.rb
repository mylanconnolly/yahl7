# frozen_string_literal: true

require 'date'

module YAHL7
  module V2
    class DataType
      # This is the HL7 data type for an extended telephone number.
      class XTN < YAHL7::V2::DataType
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             telephone_number: 0,
                             telephone_use_code: 1,
                             telephone_equipment_type: 2,
                             email_address: 3,
                             country_code: 4,
                             area_city_code: 5,
                             local_number: 6,
                             extension: 7,
                             any_text: 8,
                             extension_prefix: 9,
                             speed_dial_code: 10,
                             unformatted_telephone_number: 11
                           })

        def self.repeated?(value)
          !value.nil? && value[0].is_a?(Array)
        end
      end
    end
  end
end
