# frozen_string_literal: true

RSpec.describe YAHL7::V2::FieldParser do
  describe '#parse' do
    let(:parser) { described_class.new(YAHL7::V2::ParseOptions.new) }

    [
      %w[foo foo],
      ['foo~bar', %w[foo bar]],
      ['something&else^foo~100&101', [[%w[something else], 'foo'], %w[100 101]]]
    ].each do |input, want|
      context "when input is #{input}" do
        subject { parser.parse(input) }
        it { is_expected.to eq(want) }
      end
    end
  end
end
