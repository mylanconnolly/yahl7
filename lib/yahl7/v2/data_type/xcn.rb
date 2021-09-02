# frozen_string_literal: true

require 'date'

module YAHL7
  module V2
    class DataType
      # This is the HL7 data type for an extended composite name and ID number.
      class XCN < YAHL7::V2::DataType
        include YAHL7::V2::AliasPersonName
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             id_number: 0,
                             family_name: 1,
                             given_name: 2,
                             middle_name: 3,
                             suffix: 4,
                             prefix: 5,
                             degree: 6,
                             source_table: 7,
                             assigning_authority: 8,
                             name_type_code: 9,
                             identifier_check_digit: 10,
                             check_digit_scheme: 11,
                             identifier_type_code: 12,
                             assigning_facility: 13,
                             name_representation_code: 14,
                             name_context: 15,
                             name_validity_range: 16,
                             name_assembly_order: 17,
                             effective_date: 18,
                             expiration_date: { index: 19, class: YAHL7::V2::DataType::TS },
                             professional_suffix: { index: 20, class: YAHL7::V2::DataType::TS },
                             assigning_jurisdiction: 21,
                             assigning_agency_or_department: 22
                           })

        def full_name
          case name_assembly_order&.downcase
          when 'f' then assemble_name_family_first
          else assemble_name_given_first
          end
        end

        def self.repeated?(value)
          !value.nil? && value[0].is_a?(Array)
        end
      end
    end
  end
end
