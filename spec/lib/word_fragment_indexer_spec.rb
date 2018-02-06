require "spec_helper"

RSpec.describe WordFragmentIndexer do
  subject(:word_fragment_indexer) { WordFragmentIndexer.new(word: word, fragment_map: fragment_map) }

  let(:fragment_map) { FragmentMap.new.content }

  describe "#index" do
    before { word_fragment_indexer.index }

    context "word longer than two characters" do
      let(:word) { "wicked" }
      let(:two_letter_fragments) { ["wi", "ic", "ck", "ke", "ed"] }

      it "indexes the word at all two letter fragment keys where it belongs" do
        two_letter_fragments.each do |fragment|
          expect(fragment_map[fragment]).to include(word)
        end
      end
    end

    context "word with only two characters" do
      let(:word) { "hi" }
      let(:two_letter_fragments) { ["hi"] }

      it "indexes the word at only one fragment" do
        expect(fragment_map.values.reject(&:empty?).count).to eq(1)
      end
    end

    context "one letter word" do
      let(:word) { "I" }

      it "does not index single letter words" do
        expect(fragment_map.values).to all be_empty
      end
    end

    context "blank word" do
      let(:word) { "" }

      it "does not index blank words" do
        expect(fragment_map.values).to all be_empty
      end
    end
  end
end