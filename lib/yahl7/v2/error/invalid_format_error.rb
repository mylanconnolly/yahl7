# frozen_string_literal: true

module YAHL7
  module V2
    module Error
      # This error is raised when the input for a given data type is implausible
      # or otherwise invalid.
      class InvalidFormatError < StandardError
      end
    end
  end
end
