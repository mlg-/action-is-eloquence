require_relative "dictionary"

class Autocompleter
  attr_accessor :fragment
  attr_reader :dictionary

  def initialize(fragment:, file_paths:, result_format:)
    @fragment = fragment
    @file_paths = file_paths

    check_for_bad_data

    @result_format = result_format

    @dictionary = Dictionary.new(file_paths: file_paths).build
  end

  def results
    result_format == "hash" ? ranked_matches : print_nicely(ranked_matches)
  end

  protected
  attr_reader :result_format, :file_paths
  attr_writer :dictionary

  def all_matches
    dictionary.fragment_map[fragment]
  end

  def ranked_matches
    all_matches.each_with_object({}) do |match, matches|
      matches["#{match}"] = dictionary.frequency_map[match]
    end.sort_by { |_word, frequency| -frequency }[0..24].to_h
  end

  def print_nicely(ranked_results)
    pretty_string = "There are #{ranked_results.count} results for the fragment '#{fragment}':\n"
    ranked_results.each do |word, frequency|
      pretty_string << "'#{word}' appears #{frequency} time"
      pretty_string << "s" if frequency > 1
      pretty_string << "\n" unless ranked_results.keys.last == word
    end
    pretty_string
  end

  def check_for_bad_data
    check_for_invalid_file_paths
    check_for_invalid_fragment
  end

  def check_for_invalid_file_paths
    raise FileDoesNotExist if file_paths.nil? || file_paths.any? { |file| !File.exists?(file) }
  end

  def check_for_invalid_fragment
    raise FragmentIsInvalid if fragment.nil? || !fragment.is_a?(String) || fragment.match(/\A[a-z]{2}\z/).nil?
  end
end

class FileDoesNotExist < StandardError
  def initialize(msg="One or more of your files could not be located, please check the paths and try again.")
    super
  end
end

class FragmentIsInvalid < StandardError
  def initialize(msg="The fragment to complete must be a two-letter string.")
    super
  end
end