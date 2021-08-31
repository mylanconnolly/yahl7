# frozen_string_literal: true

module YAHL7
  module V2
    class Scanner
      # This scanner is responsible for parsing string sources for HL7 files.
      # This adds some flexibility to the program, so we don't have to always
      # parse IO sources. This allows us to accept HL7 data through a web form,
      # for example.
      class String
        MSG_HEADER = 'MSH'
        PREFIX = "#{MSG_HEADER}|"

        def initialize(src)
          @source = src
          @scanner = StringScanner.new(src)
          @message_regexp = /#{MSG_HEADER}\|/
        end

        def each
          loop do
            msg = scan_next
            break if msg.nil?

            yield msg
          end
        end

        def scan_next
          return nil if @scanner.eos?

          scan_message.strip
        end

        private

        def scan_message
          got = @scanner.scan_until(@message_regexp)
          got = @scanner.scan_until(@message_regexp) if got == PREFIX

          if got.nil?
            got = @scanner.rest
            @scanner.terminate
          end

          got = got.lstrip.delete_suffix(PREFIX)
          got.start_with?(PREFIX) ? got : PREFIX + got
        end
      end
    end
  end
end
