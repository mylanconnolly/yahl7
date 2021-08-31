# frozen_string_literal: true

require 'date'

RSpec.describe YAHL7::V2::DateTime do
  describe '::parse' do
    subject { described_class.parse(input) }

    [
      ['2012', DateTime.new(2012)],
      ['201205', DateTime.new(2012, 5)],
      ['20120505', DateTime.new(2012, 5, 5)],
      ['2012050513', DateTime.new(2012, 5, 5, 13)],
      ['201205051325', DateTime.new(2012, 5, 5, 13, 25)],
      ['20120505132510', DateTime.new(2012, 5, 5, 13, 25, 10)],
      ['20120505092510-0400', DateTime.new(2012, 5, 5, 9, 25, 10, '-0400')]
    ].each do |value, want|
      context "when given '#{value}'" do
        let(:input) { value }
        it { is_expected.to eq(want) }
      end
    end

    %w[201 20120 2012050].each do |value|
      context "when given invalid date format '#{value}'" do
        let(:input) { value }
        it { expect { subject }.to raise_error(YAHL7::V2::Error::InvalidFormatError) }
      end
    end
  end
end
