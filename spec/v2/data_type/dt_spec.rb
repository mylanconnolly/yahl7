# frozen_string_literal: true

require 'date'

RSpec.describe YAHL7::V2::DataType::DT do
  describe '#date' do
    subject { described_class.new(input).date }

    [
      ['2012', Date.new(2012)],
      ['201205', Date.new(2012, 5)],
      ['20120505', Date.new(2012, 5, 5)]
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
