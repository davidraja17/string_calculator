require 'delimiters/delimiter_factory'

class StringCalculator
    def add(input)
      return 0 if input.empty?
  
      delimiters, numbers = extract_delimiters_and_numbers(input)
  
      # Split numbers using the extracted delimiters
      split_numbers = numbers.split(Regexp.union(delimiters))
      integers = split_numbers.map(&:to_i)
  
      # Handle negative numbers
      negatives = integers.select(&:negative?)
      raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
  
      integers.sum
    end
  
    private
  
    def extract_delimiters_and_numbers(input)
      if input.start_with?("//")
        delimiter_section, numbers = input.split("\n", 2)
        delimiters = extract_delimiters(delimiter_section)
      else
        delimiters = [",", "\n"]
        numbers = input
      end
  
      [delimiters, numbers]
    end
  
    def extract_delimiters(delimiter_section)
      # Remove the leading "//"
      delimiter_section = delimiter_section[2..]
  
      # Handle multiple delimiters (e.g., //[***][%%])
      if delimiter_section.start_with?("[") && delimiter_section.end_with?("]")
        delimiter_section.scan(/\[([^\]]+)\]/).flatten
      else
        [delimiter_section]
      end
    end
  end
  
  