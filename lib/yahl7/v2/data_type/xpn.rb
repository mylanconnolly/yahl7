# frozen_string_literal: true

require 'date'

module YAHL7
  module V2
    class DataType
      # This is the HL7 data type for an extended person name. This is the data
      # type used for patient names, etc.
      class XPN < YAHL7::V2::DataType
        include YAHL7::V2::AliasPersonName
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             family_name: 0,
                             given_name: 1,
                             middle_name: 2,
                             suffix: 3,
                             prefix: 4,
                             degree: 5,
                             name_type_code: 6,
                             name_representation_code: 7,
                             name_context: 8,
                             name_validity_range: 9,
                             name_assembly_order: 10,
                             effective_date: 11,
                             expiration_date: 12,
                             professional_suffix: 13
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
