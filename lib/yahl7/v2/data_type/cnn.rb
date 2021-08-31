# frozen_string_literal: true

require 'date'

module YAHL7
  module V2
    class DataType
      # This is the HL7 data type for a composite name and ID number.
      class CNN < YAHL7::V2::DataType
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
                             assigning_authority_namespace_id: 8,
                             assigning_authority_universal_id: 9,
                             assigning_authority_universal_id_type: 10
                           })
      end
    end
  end
end
