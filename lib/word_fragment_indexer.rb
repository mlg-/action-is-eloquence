class WordFragmentIndexer
  attr_reader :fragment_map

  def initialize(word:, fragment_map:)
    @word = word
    @fragment_map = fragment_map
    @last_char_index = word.length - 1
  end

  def index
    start_index = 0; end_index = 1

    until end_index > last_char_index
      two_letter_fragment = word[start_index..end_index]
      start_index += 1; end_index += 1
      fragment_map[two_letter_fragment] << word
    end
  end

  protected
  attr_reader :word, :last_char_index
  attr_writer :fragment_map
end