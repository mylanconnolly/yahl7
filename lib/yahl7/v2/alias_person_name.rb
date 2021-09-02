# frozen_string_literal: true

module YAHL7
  module V2
    # This module can be included into a class of a data type that includes the
    # name components in order to add an `#assemble_name_family_first` method
    # and an `#assemble_name_given_first` method.
    module AliasPersonName
      # This is the method the builds the "bare" name (i.e., without prefixes
      # and/or suffixes) with the family name first.
      def bare_name_family_first
        buf = family_name.nil? || family_name == '' ? '' : "#{family_name}, "
        buf += "#{given_name} " unless given_name.nil? || given_name == ''
        buf += middle_name unless middle_name.nil? || middle_name == ''

        buf.strip
      end

      # This is the method the builds the "bare" name (i.e., without prefixes
      # and/or suffixes) with the given name first.
      def bare_name_given_first
        [given_name, middle_name, family_name]
          .reject { |p| p.nil? || p == '' }
          .join(' ')
      end

      # This is the method that builds the full name (i.e., with prefixes and/or
      # suffixes) with the family name first.
      def assemble_name_family_first
        buf = prefix.nil? || prefix == '' ? '' : "#{prefix} "
        buf += bare_name_family_first

        s = suffixes
        buf += ", #{s}" unless s == ''

        buf
      end

      # We have two locations for suffix information on a name:
      #
      # 1. The suffix, which is meant to house information like Jr, II, etc.
      # 2. The degree, which is meant to house information like MD, PhD, etc.
      #
      # This method is used to combine those into a single value to make name
      # assembly easier.
      def suffixes
        [suffix, degree]
          .reject { |p| p.nil? || p == '' }
          .map(&:strip)
          .uniq
          .join(', ')
      end

      # This is the method that builds the full name (i.e., with prefixes and/or
      # suffixes) with the given name first.
      def assemble_name_given_first
        buf = prefix.nil? || prefix == '' ? '' : "#{prefix} "
        buf += bare_name_given_first

        s = suffixes
        buf += ", #{s}" unless s == ''

        buf
      end
    end
  end
end
