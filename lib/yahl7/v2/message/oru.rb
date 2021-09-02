# frozen_string_literal: true

module YAHL7
  module V2
    class Message
      # ORU messages contain unsolicited observation results about a patient.
      class ORU < YAHL7::V2::Message
        OBSERVATION_AND_NOTE_TYPES = %w[NTE OBX].freeze

        # This method is used to return all NTE and OBX segments in their
        # original order. This can be useful for building a report of test
        # results in applicable messages.
        def observations_and_notes
          segments.filter { |s| OBSERVATION_AND_NOTE_TYPES.include?(s.type) }
        end
      end
    end
  end
end
