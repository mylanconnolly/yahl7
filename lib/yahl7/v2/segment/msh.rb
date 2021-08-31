# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      class MSH < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             field_separator: 1,
                             encoding_characters: 2,
                             sending_application: 3,
                             sending_facility: 4,
                             receiving_application: 5,
                             receiving_facility: 6,
                             message_datetime: 7,
                             security: 8,
                             message_type: 9,
                             message_control_id: 10,
                             processing_id: 11,
                             version_id: 12,
                             sequence_number: 13,
                             continuation_pointer: 14,
                             accept_acknowledgement_type: 15,
                             application_acknowledgement_type: 16,
                             country_code: 17,
                             character_set: 18,
                             principal_language: 19,
                             alternate_character_set_handling_scheme: 20,
                             message_profile_identifier: 21
                           })
      end
    end
  end
end
