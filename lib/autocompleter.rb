require_relative "dictionary"

class Autocompleter
  attr_reader :dictionary

  def initialize(fragment:, file_paths:, result_format:)
    @fragment = fragment
    @file_paths = file_paths
    @result_format = result_format

    @dictionary = Dictionary.new(file_paths: file_paths).build
  end

  def results
    unranked_matches = dictionary.fragment_map[fragment]
    matches_with_unordered_rank = unranked_matches.each_with_object({}) do |match, matches|
      matches["#{match}"] = dictionary.frequency_map.content[match]
    end
    ranked_results = matches_with_unordered_rank.sort_by { |_word, frequency| -frequency }[0..25].to_h
    result_format == "hash" ? ranked_results : print_nicely(ranked_results)
  end

  def search_again_for(fragment: fragment)
    self.fragment = fragment

    results
  end

  protected
  attr_reader :result_format
  attr_writer :dictionary
  attr_accessor :fragment

  def print_nicely(ranked_results)
    pretty_string = "There are #{ranked_results.count} results for the fragment '#{fragment}':\n"
    ranked_results.each do |word, frequency|
      pretty_string << "'#{word}' appears #{frequency} time"
      pretty_string << "s" if frequency > 1
      pretty_string << "\n" unless ranked_results.keys.last == word
    end
    pretty_string
  end
end