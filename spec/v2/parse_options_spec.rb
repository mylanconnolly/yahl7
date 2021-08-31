# frozen_string_literal: true

RSpec.describe YAHL7::V2::ParseOptions do
  describe '#from_body' do
    let(:options) { described_class.from_body(body, segment_sep) }

    context 'with standard definition' do
      let(:body) { 'MSH|^~\&' }
      let(:segment_sep) { "\r" }

      it 'should parse separators as expected' do
        expect(options.repetition_sep).to eq('|')
        expect(options.component_sep).to eq('^')
        expect(options.field_sep).to eq('~')
        expect(options.escape).to eq('\\')
        expect(options.sub_component_sep).to eq('&')
        expect(options.segment_sep).to eq("\r")
      end
    end

    context 'with non-standard definition' do
      let(:body) { 'MSH*:!%>' }
      let(:segment_sep) { "\t" }

      it 'should parse separators as expected' do
        expect(options.repetition_sep).to eq('*')
        expect(options.component_sep).to eq(':')
        expect(options.field_sep).to eq('!')
        expect(options.escape).to eq('%')
        expect(options.sub_component_sep).to eq('>')
        expect(options.segment_sep).to eq("\t")
      end
    end
  end
end
