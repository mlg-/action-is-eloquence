require "spec_helper"

RSpec.describe Dictionary do
  subject(:dictionary) { Dictionary.new(tiny_file) }

  context "a file exists" do
    let(:tiny_file) { "spec/support/tiny-file.txt" }
    let(:tiny_file_text) { "this is a little baby file \n to use as an example \n so not as to break one's brain too quickly" }

    before { File.open(tiny_file, "w+") { |file| file.write(tiny_file_text) } }
    after { File.delete(tiny_file) }

    describe "#build" do
      it "can accept one file path" do
        expect{ dictionary.build }.not_to raise_error
      end

      context "an additional file exists" do
        let(:tiny_file_copy) { "spec/support/tiny-file-copy.txt" }

        before { File.open(tiny_file_copy, "w+") { |file| file.write(tiny_file_text) } }

        after { File.delete(tiny_file_copy) }

        it "can accept many file paths" do
          expect{ Dictionary.new(tiny_file, tiny_file_copy).build }.not_to raise_error
        end
      end
    end

    describe "#frequency_map" do
      before { dictionary.build }
      
      it "counts how many occurrences there are per word" do
        expect(dictionary.frequency_map["to"]).to eq(2)
        expect(dictionary.frequency_map["quickly"]).to eq(1)
      end
    end
  end

  context "files do not exist" do
    let(:tiny_file) { "fake-file.txt" }
    
    describe "#build" do
      it "raises an error if any file does not exist" do
        expect{ dictionary.build }.to raise_error(FileDoesNotExistError)
      end
    end
  end
end