# frozen_string_literal: true

Dir[File.join(__dir__, 'data_type', '*.rb')].sort.each { |f| require f }

module YAHL7
  module V2
    # This is the base data type class for custom HL7 data types.
    class DataType
      attr_accessor :value

      def initialize(value)
        @value = value
      end

      def [](index)
        value[index]
      end
    end
  end
end
