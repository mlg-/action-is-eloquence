require_relative "fragment_map"

class Dictionary
  attr_reader :frequency_map, :fragment_map

  def initialize(file_paths:)
    @fragment_map = FragmentMap.new.build
    @frequency_map = FrequencyMap.new
    @file_paths = file_paths
  end

  def build
    raise FileDoesNotExistError if file_paths.any? { |file| !File.exists?(file) }

    file_paths.each do |file_path|
      record_word_frequencies_for_file_at(file_path)
    end

    self
  end

  protected
  attr_writer :frequency_map, :fragment_map
  attr_reader :file_paths

  def record_word_frequencies_for_file_at(file_path)
    File.open(file_path).each_line do |line|
      line.downcase.scan(/[a-z]+/) do |normalized_word|
        next if normalized_word.nil? || normalized_word.length == 1
        self.fragment_map = index_word_fragments(normalized_word) unless frequency_map.content.key?(normalized_word)
        self.frequency_map.content["#{normalized_word}"] += 1
      end
    end
  end

  def index_word_fragments(normalized_word)
    WordFragmentIndexer.new(word: normalized_word, fragment_map: self.fragment_map).index
  end
end

class FileDoesNotExistError < StandardError
  def initialize(msg="One or more of your files could not be located, please check the paths and try again.")
    super
  end
end
