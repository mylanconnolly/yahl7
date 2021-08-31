# frozen_string_literal: true

require 'strscan'
require 'stringio'

module YAHL7
  module V2
    # This is the formatter class for HL7 rich text data. It aims to format
    class Formatter
      attr_accessor :parse_options

      def initialize(parse_options = ParseOptions.new)
        @parse_options = parse_options
        @field_sep = Regexp.escape(parse_options.field_sep)
        @escape = Regexp.escape(parse_options.escape)
        @escape_regexp = /#{@escape}/
        @token_regexp = /#{@field_sep}|#{@escape}/
      end

      # This method accepts some HL7 formatted text (FT) and returns the
      # plaintext equivalent. For examples, see the specs for this method,
      # which aim to be pretty exhaustive.
      def format(text)
        return text if text[0...4] == '%PDF'

        buffer = StringIO.new
        scanner = StringScanner.new(text)
        scan_text(scanner, buffer)
        buffer.string
      end

      private

      # This method handles the actual scanning of the text and building up the
      # output buffer.
      def scan_text(scanner, buffer)
        until scanner.eos?
          substr = scanner.scan_until(@token_regexp)

          if substr.nil?
            buffer.write(scanner.rest)
            scanner.terminate
            next
          end

          buffer.write(substr.chop)
          handle_match(scanner, buffer)
        end
      end

      # When the scanner comes across a match, it is either a field separator
      # (i.e., the field has repeated) or it is an escape character (i.e., there
      # is an HL7 formatting directive). This method is used to determine which
      # was found and handle it appropriately.
      def handle_match(scanner, buffer)
        case scanner.matched
        when parse_options.field_sep then buffer.write("\n")
        when parse_options.escape then handle_escape(buffer, scanner)
        end
      end

      # This method is used to handle HL7 formatting escape sequences. The logic
      # here is pretty simple, mostly just a lookup. Some escape codes can be
      # repeated, and for those we use a capture group to get the number of
      # times it should be duplicated.
      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
      def handle_escape(buffer, scanner)
        case scanner.scan_until(@escape_regexp).chop
        when 'E' then buffer.write(parse_options.escape)
        when 'F' then buffer.write(parse_options.repetition_sep)
        when 'R' then buffer.write(parse_options.field_sep)
        when 'S' then buffer.write(parse_options.component_sep)
        when 'T' then buffer.write(parse_options.sub_component_sep)
        when /\.(in|sk|ti)(\d*)/ then buffer.write(regexp_repeat(' ', Regexp.last_match(2)))
        when /\.(sp)(\d*)/ then buffer.write(regexp_repeat("\n", Regexp.last_match(2)))
        when '.br', '.ce' then buffer.write("\n")
        end
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity

      # This method handles possibly-duplicated format codes. In the event that
      # the count was omitted, it should be assumed that the character is used
      # once. For example `/.sp/` would result in one newline, while `/.sp2/`
      # would result in 2 newlines.
      def regexp_repeat(char, match)
        match == '' ? char : char * match.to_i
      end
    end
  end
end
