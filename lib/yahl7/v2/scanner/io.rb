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
          @first = true
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

        def scan_message
          if @first
            @source.readline('MSH|^~')
            @first = false
          end

          line = @source.readline('MSH|^~').delete_suffix('MSH|^~')
          "MSH|^~#{line.strip}"
        end
      end
    end
  end
end
