# frozen_string_literal: true

RSpec.describe YAHL7::V2::Formatter do
  describe '#format' do
    subject { formatter.format(input) }

    context 'with standard options' do
      let(:formatter) { described_class.new }

      context 'if text appears to be a PDF document' do
        let(:input) { '%PDF ...' }

        it { is_expected.to eq('%PDF ...') }
      end

      context 'without any formatting' do
        let(:input) { 'this is a test' }

        it { is_expected.to eq('this is a test') }
      end

      context 'with repeat characters' do
        let(:input) { 'this~is~a~test' }

        it { is_expected.to eq("this\nis\na\ntest") }
      end

      context 'with basic escape codes' do
        let(:input) { '\\E\\\\F\\\\R\\\\S\\\\T\\\\.br\\\\.ce\\' }

        it { is_expected.to eq("\\|~^&\n\n") }
      end

      context 'with repeated escape codes' do
        let(:input) { 'in\\.in2\\sk\\.sk2\\ti\\.ti2\\sp\\.sp2\\' }

        it { is_expected.to eq("in  sk  ti  sp\n\n") }
      end

      context 'with non-repeated repeat escape codes' do
        let(:input) { 'in\\.in\\sk\\.sk\\ti\\.ti\\sp\\.sp\\' }

        it { is_expected.to eq("in sk ti sp\n") }
      end
    end
  end
end
