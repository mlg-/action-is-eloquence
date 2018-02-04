class FragmentMap
  attr_reader :content

  def initialize
    @content = {}
  end

  def build
    unique_combinations = ("a".."z").to_a.combination(2).map(&:join)
    all_possible_fragments = unique_combinations.each_with_object([]) do |combination, expanded_collection|
      expanded_collection << combination # original unique combinations
      expanded_collection << combination.reverse # combinations are not order-dependent, so add all the reversals of the combinations we know about
      ("a".."z").to_a.map { |letter| "#{letter}#{letter}" }.each { |double_letter_fragment| expanded_collection << double_letter_fragment } # double letter fragments, like "ll"
    end
    all_possible_fragments.each { |fragment| content[fragment] = [] }

    content
  end

  protected
  attr_writer :content
end