# frozen_string_literal: true

require 'date'

RSpec.describe YAHL7::V2::DataType::FT do
  describe '#formatted' do
    subject { described_class.new(input, YAHL7::V2::ParseOptions.new).formatted }

    [
      ['this~is~a~test', "this\nis\na\ntest"],
      ['\\E\\\\F\\\\R\\\\S\\\\T\\\\.br\\\\.ce\\', "\\|~^&\n\n"],
      ['in\\.in2\\sk\\.sk2\\ti\\.ti2\\sp\\.sp2\\', "in  sk  ti  sp\n\n"],
      ['in\\.in\\sk\\.sk\\ti\\.ti\\sp\\.sp\\', "in sk ti sp\n"]
    ].each do |value, want|
      context "when given '#{value}'" do
        let(:input) { value }
        it { is_expected.to eq(want) }
      end
    end
  end
end
