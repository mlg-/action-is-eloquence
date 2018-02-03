class Dictionary
  attr_reader :frequency_map

  def initialize(*file_paths)
    @frequency_map = Hash.new(0)
    @file_paths = file_paths
  end

  def build
    raise FileDoesNotExistError if file_paths.any? { |file| !File.exists?(file) }

    file_paths.each do |file_path|
      record_word_frequencies_for_file_at(file_path)
    end
  end

  protected
  attr_writer :frequency_map
  attr_reader :file_paths

  def record_word_frequencies_for_file_at(file_path)
    File.open(file_path).each_line do |line|
      # maybe try going char by char here instead and use spaces as delimiters
      # to decide what a word is. also can delete bad stuff like numbers, weird chars
      line.split.each do |word|
        self.frequency_map["#{word}"] += 1
      end
    end
  end
end

class FileDoesNotExistError < StandardError
  def initialize(msg="One or more of your files could not be located, please check the paths and try again.")
    super
  end
end
