require "spec_helper"

RSpec.describe FragmentMap do
  subject(:fragment_map) { FragmentMap.new }

  describe "#build" do
    # Not a magic number! The result of ((26! / (2!(26 - 2)!)) * 2) + 26 in mathematical terms, which is:
    # every unique 2-letter combination of each letter * 2 to cover either order of appearance, and every double letter combination.
    let(:number_of_possible_fragments) { 676 }

    it "has the correct number of downcase letter combinations as keys" do
      expect(fragment_map.build.keys.count).to eq(number_of_possible_fragments)
    end

    it "initializes an array for each fragment" do
      expect(fragment_map.build.values).to all(be_a Array)
    end
  end
end