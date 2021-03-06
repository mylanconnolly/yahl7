# frozen_string_literal: true

require_relative 'parse_options'

module YAHL7
  module V2
    # This class is responsible for parsing the information out of a field.
    class FieldParser
      attr_accessor :parse_options

      def initialize(parse_options)
        @parse_options = parse_options
      end

      def parse(body)
        split_fields(body)
      end

      private

      def split_fields(body)
        parts = split_body(body, parse_options.field_sep)
        parts.is_a?(Array) ? parts.map { |f| split_components(f) } : split_components(parts)
      end

      def split_components(body)
        components = split_body(body, parse_options.component_sep)

        if components.is_a?(String)
          split_sub_components(components)
        else
          components.map { |c| split_sub_components(c) }
        end
      end

      def split_sub_components(body)
        split_body(body, parse_options.sub_component_sep)
      end

      def split_body(body, separator)
        return '' if body.nil?

        got = body.split(separator)
        got.count < 2 ? body : got
      end
    end
  end
end
