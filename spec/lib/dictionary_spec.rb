require "spec_helper"

RSpec.describe Dictionary do
  subject(:dictionary) { Dictionary.new(file_paths: file_paths) }

  describe "#build" do
    context "a file exists" do
      let(:file_paths) { [tiny_file] }
      let(:tiny_file) { "spec/support/tiny-file.txt" }
      let(:tiny_file_text) { "this is a little baby file \n to use as an example \n so not as to break one's brain too quickly" }

      before { File.open(tiny_file, "w+") { |file| file.write(tiny_file_text) } }
      after { File.delete(tiny_file) }

      it "can accept one file path" do
        expect{ dictionary.build }.not_to raise_error
      end

      it "adds and increments words in the frequency map" do
        dictionary.build

        expect(dictionary.frequency_map["to"]).to eq(2)
        expect(dictionary.frequency_map["quickly"]).to eq(1)
      end

      context "an additional file exists" do
        let(:file_paths) { [tiny_file, tiny_file_copy] }
        let(:tiny_file_copy) { "spec/support/tiny-file-copy.txt" }

        before { File.open(tiny_file_copy, "w+") { |file| file.write(tiny_file_text) } }
        after { File.delete(tiny_file_copy) }

        it "can accept many file paths" do
          expect{ dictionary.build }.not_to raise_error
        end
      end
    end

    context "files do not exist" do
      let(:file_paths) { [fake_tiny_file] }
      let(:fake_tiny_file) { "fake-file.txt" }

      it "raises an error if any file does not exist" do
        expect{ dictionary.build }.to raise_error(FileDoesNotExistError)
      end
    end
  end
end