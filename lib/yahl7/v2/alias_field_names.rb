# frozen_string_literal: true

module YAHL7
  module V2
    # This module can be included into a class to make the `define_field_names`
    # macro available. This macro allows you to define repetitive field name
    # aliases in a quick and easy fashion.
    #
    # For example:
    #
    #     include YAHL7::V2::AliasFieldNames
    #
    #      define_field_names({ patient_identifier_list: 3 })
    #
    # Will define a method named `patient_identifier_list` which fetches the
    # third field from the segment.
    #
    # If you want to define more complex methods, you can exclude them from this
    # hash and define them manually.
    module AliasFieldNames
      def self.included(base)
        base.extend(ClassMethods)
      end

      def make_field(klass, value)
        return nil if value.nil? || value == ''

        if klass.respond_to?(:repeated?) && klass.repeated?(value)
          value.map { |v| new_class_value(klass, v) }
        else
          new_class_value(klass, value)
        end
      end

      def new_class_value(klass, value)
        case klass
        when YAHL7::V2::DataType::FT then klass.new(value, parse_options)
        else klass.new
        end
      end

      # This is the module that actually extends the segment.
      module ClassMethods
        # This method is used to define the field name mappings for the data
        # type / segment.
        #
        # It is possible to return a string, in which case you can use an
        # integer value. If you want to return a specific data type, you must
        # use a hash instead, in the form of (for example):
        #
        #     define_field_names({
        #       some_field: 0,
        #       some_other_field: { index: 1, class: YAHL7::V2::DataType::TS }
        #     })
        #
        # This defines the method `some_field` which returns a string, while
        # the other method `some_other_field` returns either a `nil` value or a
        # `YAHL7::V2::DataType::TS` value.
        #
        # It is possible that the field is repeatable. If so, it is up to the
        # data type to define a `::repeated?` method that receives the raw
        # value and then it determines if the field was repeated or not. If it
        # is repeatable and it is determined to be repeated, an array of that
        # type is returned.
        def define_field_names(mappings)
          mappings.each do |name, mapping|
            case mapping
            when Integer then define_method(name) { self[mapping] }
            when Hash then define_method(name) { make_field(mapping[:class], self[mapping[:index]]) }
            end
          end
        end
      end
    end
  end
end
