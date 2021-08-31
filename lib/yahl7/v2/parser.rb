# frozen_string_literal: true

require 'strscan'

require_relative 'message'
require_relative 'parse_options'
require_relative 'scanner'

module YAHL7
  module V2
    # The parser class is similar to the scanner class, except it returns the
    # parsed HL7 messages rather than string representations of the HL7 messages
    # (making it useful for pulling data out of these messages).
    class Parser
      attr_reader :scanner, :segment_sep

      def initialize(src, segment_sep = YAHL7::V2::SEGMENT_SEP)
        @scanner = Scanner.new(src)

        @segment_sep = segment_sep
      end

      def each
        loop do
          msg = parse_next
          break if msg.nil?

          yield msg
        end
      end

      def parse_next
        body = scanner.scan_next
        return nil if body.nil?

        Message.parse(body)
      end
    end
  end
end
