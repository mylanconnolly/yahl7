# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      # NTE segments contain notes and comments.
      class NTE < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             set_id: 1,
                             source_of_comment: 2,
                             comment: { index: 3, class: YAHL7::V2::DataType::FT },
                             comment_type: 4
                           })
      end
    end
  end
end
