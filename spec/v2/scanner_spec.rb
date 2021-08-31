# frozen_string_literal: true

RSpec.describe YAHL7::V2::Scanner do
  describe '#scanner' do
    subject { described_class.new(input).scanner }

    context 'with string input' do
      let(:input) { 'MSH|...' }

      it { is_expected.to be_a(described_class::String) }
    end

    context 'with string IO input' do
      let(:input) { StringIO.new('MSH|...') }

      it { is_expected.to be_a(described_class::IO) }
    end

    context 'with file input' do
      let(:path) { File.join(File.dirname(File.dirname(__FILE__)), 'fixtures/test.hl7') }
      let(:input) { File.open(path) }

      it { is_expected.to be_a(described_class::IO) }
    end
  end
end
