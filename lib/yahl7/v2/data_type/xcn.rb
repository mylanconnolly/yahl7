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
                             assigning_facility: 11,
                             name_representation_code: 12,
                             name_context: 16,
                             name_validity_range: 17,
                             name_assembly_order: 18,
                             effective_date: 19,
                             expiration_date: 20,
                             professional_suffix: 21,
                             assigning_jurisdiction: 22,
                             assigning_agency_or_department: 23
                           })

        def full_name
          case name_assembly_order&.downcase
          when 'f' then assemble_name_family_first
          else assemble_name_given_first
          end
        end
      end
    end
  end
end
