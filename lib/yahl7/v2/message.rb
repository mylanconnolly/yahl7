# frozen_string_literal: true

Dir[File.join(__dir__, 'message', '*.rb')].sort.each { |f| require f }

module YAHL7
  module V2
    # An HL7 message is a hierarchical data structure. They are generally
    # associated with a triggering event of some sort.
    class Message
      attr_accessor :segments, :parse_options

      def initialize(body, parse_options = nil)
        @parse_options = parse_options || ParseOptions.from_body(body)

        @segments = body
                    .split(parse_options.segment_sep)
                    .map { |s| Segment.parse(s, parse_options) }
      end

      def to_s
        @to_s ||= segments.join(parse_options.segment_sep)
      end

      def [](index)
        case index
        when Integer then segments[index]
        when String then segments_by_type(index)
        end
      end

      def each(&block)
        segments.each(&block)
      end

      # This method should be used rather than the initializer where possible,
      # because it will defer to a sub-class where possible. This results in
      # the ability to have message type-specific behavior, where possible.
      def self.parse(body, parse_options = nil)
        parse_options ||= ParseOptions.from_body(body)
        message_type(body, parse_options).new(body, parse_options)
      end

      # This method is used to determine which class should be used to represent
      # the given HL7 message string. See `get_message_class` for more
      # information, as this method simply finds the type code and then hands it
      # off to `get_message_class` to find the class to use.
      def self.message_type(body, parse_options = nil)
        return nil if body.length < 8

        parse_options ||= ParseOptions.from_body(body)
        head = body.split(parse_options.segment_sep)[0]
        return nil if head.nil?

        type = head.split(parse_options.repetition_sep)[8]
        return nil if type.nil?

        code = type.split(parse_options.component_sep)[0]
        get_message_class(code)
      end

      # This method is used to determine which class should be used to represent
      # the given HL7 message type code (i.e., ADT, ORU, etc.). If a subclass is
      # defined for it, we return that class in order to allow for some type-
      # specific behavior. Otherwise, we use this class.
      def self.get_message_class(code)
        klass = Module.const_get("#{name}::#{code}")
        klass.is_a?(Class) ? klass : self
      rescue NameError
        self
      end

      private

      def segments_by_type(type)
        segments.filter { |s| s.type == type }
      end
    end
  end
end
