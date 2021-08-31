# frozen_string_literal: true

require 'date'

module YAHL7
  module V2
    # This module contains helpers around dealing with HL7 timestamps.
    module DateTime
      # This method is used to parse the datetime out of a given string while
      # adhering to the HL7 formatting guidelines. There are three possible
      # outcomes from calling this method:
      #
      # 1. You receive a nil if the value is either nil or an empty string
      # 2. An exception is raised if the timestamp is in an unknown format
      # 3. A DateTime is returned with the appropriate accuracy.
      def self.parse(value)
        return nil if value.nil? || value == ''

        parts = value.split(/[+-]/)
        timestamp = parts[0]
        timezone = parts[1]

        format = timestamp_format(timestamp)
        raise YAHL7::V2::Error::InvalidFormatError, 'Unknown timestamp format' if format.nil?

        format += '%z' unless timezone.nil?
        ::DateTime.strptime(value, format)
      end

      # NOTE: This does not currently handle fractional seconds, which is
      # possible under the HL7 spec (up to 4 digits).
      def self.timestamp_format(timestamp)
        case timestamp.length
        when 4 then '%Y'
        when 6 then '%Y%m'
        when 8 then '%Y%m%d'
        when 10 then '%Y%m%d%H'
        when 12 then '%Y%m%d%H%M'
        when 14 then '%Y%m%d%H%M%S'
        end
      end

      private_class_method :timestamp_format
    end
  end
end
