# frozen_string_literal: true

require 'forwardable'

require_relative 'scanner/io'
require_relative 'scanner/string'

module YAHL7
  module V2
    # This class is responsible for scanning the HL7 messages out of a given
    # source. This source can be either a string or an IO.
    class Scanner
      extend Forwardable

      attr_reader :scanner

      def_delegators :@scanner, :each, :scan_next

      def initialize(src)
        case src
        when ::String then @scanner = YAHL7::V2::Scanner::String.new(src)
        when ::IO, ::File, ::StringIO then @scanner = YAHL7::V2::Scanner::IO.new(src)
        else raise 'Unknown source type'
        end
      end
    end
  end
end
