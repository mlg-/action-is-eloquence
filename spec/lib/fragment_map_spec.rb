require "spec_helper"

RSpec.describe FragmentMap do
  subject(:fragment_map) { FragmentMap.new }

  describe "#content" do
    # Not a magic number! 26 * 26.
    # Every unique 2-letter combination of each letter in either order of appearance, and every double letter combination.
    let(:number_of_possible_fragments) { 676 }

    it "has the correct number of downcase letter combinations as keys" do
      expect(fragment_map.content.keys.count).to eq(number_of_possible_fragments)
    end

    it "initializes an array for each fragment" do
      expect(fragment_map.content.values).to all(be_a Array)
    end
  end
end