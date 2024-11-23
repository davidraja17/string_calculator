require_relative 'delimiters/delimiter_factory'

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = DelimiterFactory.get_delimiter(numbers)
    parsed_numbers = delimiter.parse(numbers)

    negatives = parsed_numbers.map(&:to_i).select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    parsed_numbers.map(&:to_i).sum
  end
end