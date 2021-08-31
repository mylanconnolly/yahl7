# frozen_string_literal: true

module YAHL7
  module V2
    class Scanner
      # This scanner is responsible for scanning IO sources for HL7 messages.
      # These IO sources can be StringIO, File, or anything else that is a Ruby
      # IO.
      class IO
        MSG_HEADER = 'MSH'
        PREFIX = "#{MSG_HEADER}|"

        def initialize(src)
          @source = src
          @message_regexp = /#{MSG_HEADER}\|/
          @buffer = StringIO.new
        end

        def each
          loop do
            msg = scan_next
            break if msg.nil?

            yield msg
          end
        end

        def scan_next
          return nil if @source.eof? && @buffer.length.zero?

          scan_message.strip
        end

        private

        def read_message
          msg = @buffer.string
          @buffer = StringIO.new
          msg
        end

        def scan_line
          line = @source.readline(YAHL7::V2::SEGMENT_SEP)
          "#{line.strip}\r"
        end

        def scan_message
          loop do
            return read_message if @source.eof?

            line = scan_line

            if line[0..2] == MSG_HEADER && @buffer.length.positive?
              msg = read_message
              @buffer.write(line)
              return msg
            end

            @buffer.write(line)
          end
        end
      end
    end
  end
end
