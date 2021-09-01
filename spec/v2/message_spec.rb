# frozen_string_literal: true

RSpec.describe YAHL7::V2::Message do
  let(:msg) { 'MSH|^~\&|MegaReg|XYZHospC|SuperOE|XYZImgCtr|20060529090131-0500||__TYPE__^A01^ADT_A01|01052901|P|2.5' }

  describe '#[]' do
    let(:path) { File.join(File.dirname(File.dirname(__FILE__)), 'fixtures/test.hl7') }

    let(:parsed) do
      described_class.parse(File.read(path))
    end

    context 'when index is an integer' do
      it 'returns the segment at the given index' do
        expect(parsed[0]).to be_a(YAHL7::V2::Segment::MSH)
        expect(parsed[2]).to be_a(YAHL7::V2::Segment::PID)
      end
    end

    context 'when index is a string' do
      it 'returns all segments with the given type' do
        expect(parsed['MSH'].count).to eq(1)
        expect(parsed['OBX'].count).to eq(2)
      end
    end
  end

  describe '::parse' do
    DEFINED_MESSAGE_TYPES.each do |code, klass|
      it "correctly dispatches known message type #{code}" do
        expect(described_class.parse(msg.gsub('__TYPE__', code))).to be_a(klass)
      end
    end

    it 'uses base message class for unknown message types' do
      expect(described_class.parse(msg.gsub('__TYPE__', 'FOO'))).to be_a(described_class)
      expect(described_class.parse(msg.gsub('__TYPE__', 'ZZZ'))).to be_a(described_class)
    end
  end

  describe '::message_type' do
    DEFINED_MESSAGE_TYPES.each do |code, klass|
      it "correctly dispatches known message type #{code}" do
        expect(described_class.message_type(msg.gsub('__TYPE__', code))).to eq(klass)
      end
    end

    it 'uses base message class for unknown message types' do
      expect(described_class.message_type(msg.gsub('__TYPE__', 'FOO'))).to eq(described_class)
      expect(described_class.message_type(msg.gsub('__TYPE__', 'ZZZ'))).to eq(described_class)
    end

    it 'gracefully handles implausible data' do
      expect(described_class.message_type('')).to eq(described_class)
      expect(described_class.message_type('MSH|^~\&|MegaReg|XYZHospC|SuperOE|XYZImgCtr|')).to eq(described_class)
    end
  end

  describe '::get_message_class' do
    DEFINED_MESSAGE_TYPES.each do |code, klass|
      it "correctly dispatches known message type #{code}" do
        expect(described_class.get_message_class(code)).to eq(klass)
      end
    end

    it 'uses base message class for unknown message types' do
      expect(described_class.get_message_class('FOO')).to eq(described_class)
      expect(described_class.get_message_class('ZZZ')).to eq(described_class)
    end
  end
end
