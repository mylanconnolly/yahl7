# frozen_string_literal: true

RSpec.describe YAHL7::V2::Scanner::IO do
  let(:scanner) { described_class.new(input) }
  let(:messages) { %w[MSH|. MSH|.. MSH|...] }

  describe '#each' do
    context 'when messages are separated by return' do
      let(:input) { StringIO.new(messages.join("\r")) }

      it 'scans all messages' do
        found = []
        scanner.each { |msg| found << msg }
        expect(found).to eq(messages)
      end
    end

    context 'when messages are separated by newline' do
      let(:input) { StringIO.new(messages.join("\n")) }

      it 'scans all messages' do
        found = []
        scanner.each { |msg| found << msg }
        expect(found).to eq(messages)
      end
    end
  end

  describe '#scan_next' do
    context 'when messages are separated by return' do
      let(:input) { StringIO.new(messages.join("\r")) }

      it 'scans all messages' do
        found = []
        3.times { found << scanner.scan_next }
        expect(found).to eq(messages)
        expect(scanner.scan_next).to eq(nil)
      end
    end

    context 'when messages are separated by newline' do
      let(:input) { StringIO.new(messages.join("\n")) }

      it 'scans all messages' do
        found = []
        3.times { found << scanner.scan_next }
        expect(found).to eq(messages)
        expect(scanner.scan_next).to eq(nil)
      end
    end
  end
end
