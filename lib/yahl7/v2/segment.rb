# frozen_string_literal: true

require 'strscan'

require_relative 'field_parser'

Dir[File.join(__dir__, 'segment', '*.rb')].sort.each { |f| require f }

module YAHL7
  module V2
    # Segments are the first level of data within a message. They define in
    # general terms the type of data enclosed within. Data within a segment is
    # parsed lazily and then cached. This allows us to speed up the parsing of
    # HL7 segments because not all of the data will be necessary.
    #
    # Subsequent data access will be cached, however, so the performance hit of
    # subsequent calls should be negligable.
    class Segment
      attr_accessor :body, :parts, :field_parser, :parse_options

      def initialize(body, parse_options)
        @body = body
        @parts = @body.split(parse_options.repetition_sep)
        @parsed = Array.new(@parts.count)
        @field_parser = FieldParser.new(parse_options)
        @parse_options = parse_options

        return unless defined?(FIELD_MAPPING)
      end

      def to_s
        @body
      end

      # This method allows users to use an index to get a field out of a segment
      # at a given position. This allows data to be fetched from segments like
      # arrays as shown below:
      #
      #     segment[0]
      #     => 'MSH'
      def [](index)
        @parsed[index] ||= field_parser.parse(parts[index])
      end

      def type
        parts[0]
      end

      def self.parse(body, parse_options)
        segment_type(body, parse_options).new(body, parse_options)
      end

      def self.segment_type(body, parse_options)
        code = body.split(parse_options.repetition_sep)[0]
        get_segment_class(code)
      end

      def self.get_segment_class(code)
        klass = Module.const_get("#{name}::#{code}")
        klass.is_a?(Class) ? klass : self
      rescue NameError
        self
      end
    end
  end
end
