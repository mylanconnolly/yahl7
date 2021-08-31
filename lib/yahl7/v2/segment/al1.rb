# frozen_string_literal: true

module YAHL7
  module V2
    class Segment
      # AL1 segments contain patient allergy information.
      class AL1 < YAHL7::V2::Segment
        include YAHL7::V2::AliasFieldNames

        define_field_names({
                             set_id: 1,
                             allergen_type_code: 2,
                             allergen_code: 3,
                             allergen_severity_code: 4,
                             allergen_reaction_code: 5,
                             identification_date: { index: 6, class: YAHL7::V2::DataType::DT }
                           })
      end
    end
  end
end
