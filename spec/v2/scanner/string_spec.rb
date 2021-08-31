# frozen_string_literal: true

RSpec.describe YAHL7::V2::Scanner::String do
  let(:scanner) { described_class.new(input) }
  let(:messages) { %w[MSH|. MSH|.. MSH|...] }
  let(:input) { messages.join("\r") }

  describe '#each' do
    it 'scans all messages' do
      found = []
      scanner.each { |msg| found << msg }
      expect(found).to eq(messages)
    end
  end

  describe '#scan_next' do
    it 'scans all messages' do
      found = []
      3.times { found << scanner.scan_next }
      expect(found).to eq(messages)
      expect(scanner.scan_next).to eq(nil)
    end
  end
end
