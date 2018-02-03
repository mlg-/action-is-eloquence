require "spec_helper"

RSpec.describe Autocompleter do
  subject(:autocompleter) { Autocompleter.new(fragment: fragment, file_paths: [file_path], result_format: result_format) }

  let(:fragment) { "th" }
  let(:file_path) { "spec/support/macbeth-fragment.txt" }

  let(:macbeth_text_fragment) {
    "HECATE. O, well done! I commend your pains,
    And everyone shall share i' the gains.
    And now about the cauldron sing,
    Like elves and fairies in a ring,
    Enchanting all that you put in.
                              Music and a song, \"Black spirits.\"
                                                 Hecate retires.
  SECOND WITCH. By the pricking of my thumbs,
    Something wicked this way comes.
    Open, locks,
    Whoever knocks!

                      Enter Macbeth.
    "
  }

  describe "#result" do
    before(:each) { File.open(file_path, "w+") { |file| file.write(macbeth_text_fragment) } }
    after(:each) { File.delete(file_path) }

    context "hash result is requested" do
      let(:result_format) { "hash" }

      it "returns no more than 25 results" do
        expect(autocompleter.results.count).to be <=25
      end

      it "returns the results in order of frequency" do
        expect(autocompleter.results.values.first).to be >= autocompleter.results.values.last
      end
    end

    context "pretty print result is requested" do
      let(:result_format) { "pretty print" }
      let(:pretty_result) { "There are 6 results for the fragment 'th':\n'the' appears 3 times\n'that' appears 1 time\n'thumbs' appears 1 time\n'something' appears 1 time\n'this' appears 1 time\n'macbeth' appears 1 time" }

      it "returns a string representation of the results" do
        expect(autocompleter.results).to eq(pretty_result)
      end
    end
  end
end