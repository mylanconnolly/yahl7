# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      # MSH segments contain the intent, source, and destination of the HL7
      # message.
      class MSH < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             field_separator: 1,
                             sending_application: 2,
                             sending_facility: 3,
                             receiving_application: 4,
                             receiving_facility: 5,
                             message_datetime: { index: 6, class: YAHL7::V2::DataType::TS },
                             security: 7,
                             message_type: 8,
                             message_control_id: 9,
                             processing_id: 10,
                             version_id: 11,
                             sequence_number: 12,
                             continuation_pointer: 13,
                             accept_acknowledgement_type: 14,
                             application_acknowledgement_type: 15,
                             country_code: 16,
                             character_set: 17,
                             principal_language: 18,
                             alternate_character_set_handling_scheme: 19,
                             message_profile_identifier: 20
                           })
      end
    end
  end
end
