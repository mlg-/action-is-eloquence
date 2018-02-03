class FrequencyMap
  attr_accessor :content
  def initialize
    @content = Hash.new(0)
  end
end