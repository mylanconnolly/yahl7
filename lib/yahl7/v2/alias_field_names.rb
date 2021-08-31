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

      # This is the module that actually extends the segment.
      module ClassMethods
        def define_field_names(mappings)
          mappings.each do |name, mapping|
            case mapping
            when Integer then define_method(name) { self[mapping] }
            when Hash
              define_method(name) do
                value = self[mapping[:index]]
                value.nil? || value == '' ? nil : mapping[:class].new(value)
              end
            end
          end
        end
      end
    end
  end
end
