# frozen_string_literal: true

require 'date'

RSpec.describe YAHL7::V2::DataType::XPN do
  describe '#full_name' do
    subject { described_class.new(input).full_name }

    [
      [%w[Doe John], 'John Doe'],
      [%w[Doe John P], 'John P Doe'],
      [%w[Doe John P Jr], 'John P Doe, Jr'],
      [%w[Doe John P Jr Dr], 'Dr John P Doe, Jr'],
      [%w[Doe John P Jr Dr MD], 'Dr John P Doe, Jr, MD'],
      [['Doe', 'John', 'P', 'Jr', 'Dr', 'MD', '', '', '', '', 'F'], 'Dr Doe, John P, Jr, MD'],
      [['Doe', 'John', 'P', 'Jr', 'Dr', 'MD', '', '', '', '', 'G'], 'Dr John P Doe, Jr, MD']
    ].each do |value, want|
      context "when given '#{value}'" do
        let(:input) { value }
        it { is_expected.to eq(want) }
      end
    end
  end
end
