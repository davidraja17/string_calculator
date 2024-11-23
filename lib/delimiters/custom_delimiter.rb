require_relative 'base_delimiter'

class CustomDelimiter < BaseDelimiter
  def parse(numbers)
    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..].split("\n", 2)
      numbers.split(delimiter)
    else
      []
    end
  end
end