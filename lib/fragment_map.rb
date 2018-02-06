class FragmentMap
  attr_reader :content

  def initialize
    @content = build_map
  end

  protected
  attr_reader :letter_array, :unique_combinations
  attr_writer :content

  def build_map
    content = {}
    all_possible_fragments.each { |fragment| content[fragment] = [] }
    content
  end

  def all_possible_fragments
    two_letter_combinations = []
    two_letter_combinations.concat(unique_combinations)
    two_letter_combinations.concat(unique_combinations_reversed)
    two_letter_combinations.concat(double_letter_fragments)
  end

  def letter_array
    @letter_array ||= ("a".."z").to_a
  end

  def unique_combinations
    @unique_combinations ||= letter_array.combination(2).map(&:join)
  end

  def unique_combinations_reversed
    unique_combinations.map(&:reverse)
  end

  def double_letter_fragments
    letter_array.map { |letter| "#{letter}#{letter}" }
  end
end