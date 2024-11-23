require_relative 'base_delimiter'

class DefaultDelimiter < BaseDelimiter
  def parse(numbers)
    numbers.split(/,|\n/)
  end
end