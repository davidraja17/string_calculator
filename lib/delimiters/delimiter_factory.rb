require_relative 'default_delimiter'
require_relative 'custom_delimiter'

class DelimiterFactory
  def self.get_delimiter(numbers)
    if numbers.start_with?("//")
      CustomDelimiter.new
    else
      DefaultDelimiter.new
    end
  end
end