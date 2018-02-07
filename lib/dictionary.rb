require_relative "fragment_map"
require_relative "frequency_map"
require_relative "word_fragment_indexer"

class Dictionary
  attr_reader :frequency_map, :fragment_map

  def initialize(file_paths:)
    @fragment_map = FragmentMap.new.content
    @frequency_map = FrequencyMap.new.content
    @file_paths = file_paths
  end

  def build
    file_paths.each { |file_path| record_word_frequencies_for_file_at(file_path) }

    self
  end

  protected
  attr_writer :frequency_map, :fragment_map
  attr_reader :file_paths

  def record_word_frequencies_for_file_at(file_path)
    File.open(file_path).each_line do |line|
      line.downcase.scan(/[a-z]+/) do |normalized_word|
        next if normalized_word.nil? || normalized_word.length == 1
        self.fragment_map = index_word_fragments(normalized_word) unless frequency_map.key?(normalized_word)
        self.frequency_map["#{normalized_word}"] += 1
      end
    end
  end

  def index_word_fragments(normalized_word)
    fragment_indexer = WordFragmentIndexer.new(word: normalized_word, fragment_map: self.fragment_map)
    fragment_indexer.index
    fragment_indexer.fragment_map # pass back the modified fragment map
  end
end
