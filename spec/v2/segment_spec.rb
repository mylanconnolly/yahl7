# frozen_string_literal: true

RSpec.describe YAHL7::V2::Segment do
  let(:parse_options) { YAHL7::V2::ParseOptions.new }

  describe '#[]' do
    it 'should return the parsed data correctly' do
      expect(described_class.parse('FOO|1', parse_options)[1]).to eq('1')
      expect(described_class.parse('FOO|1^2', parse_options)[1]).to eq(%w[1 2])
    end
  end

  describe '#type' do
    it 'should be able to return the type of segment' do
      expect(described_class.parse('MSH|...', parse_options).type).to eq('MSH')
      expect(described_class.parse('PID|...', parse_options).type).to eq('PID')
    end
  end

  describe '::parse' do
    DEFINED_SEGMENT_TYPES.each do |code, klass|
      it "correctly dispatches known message type #{code}" do
        expect(described_class.parse("#{code}|...", parse_options)).to be_a(klass)
      end
    end

    it 'uses base message class for unknown message types' do
      expect(described_class.parse('FOO|...', parse_options)).to be_a(described_class)
      expect(described_class.parse('ZZZ|...', parse_options)).to be_a(described_class)
    end
  end

  describe '::segment_type' do
    DEFINED_SEGMENT_TYPES.each do |code, klass|
      it "correctly dispatches known message type #{code}" do
        expect(described_class.segment_type("#{code}|...", parse_options)).to eq(klass)
      end
    end

    it 'uses base message class for unknown message types' do
      expect(described_class.segment_type('FOO|...', parse_options)).to eq(described_class)
      expect(described_class.segment_type('ZZZ|...', parse_options)).to eq(described_class)
    end
  end

  describe '::get_segment_class' do
    DEFINED_SEGMENT_TYPES.each do |code, klass|
      it "correctly dispatches known message type #{code}" do
        expect(described_class.get_segment_class(code)).to eq(klass)
      end
    end

    it 'uses base message class for unknown message types' do
      expect(described_class.get_segment_class('FOO')).to eq(described_class)
      expect(described_class.get_segment_class('ZZZ')).to eq(described_class)
    end
  end
end
