# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      class NTE < YAHL7::V2::Segment
        include YAHL7::V2::SegmentFieldNames

        define_field_names({
                             set_id: 1,
                             source_of_comment: 2,
                             comment: 3,
                             comment_type: 4
                           })
      end
    end
  end
end
