require 'rspec'
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }
  
  describe "#add" do

    context "when the input is an empty string" do
        it "returns 0" do
        expect(calculator.add("")).to eq(0)
        end
    end

    context "when the input has a single number" do
        it "returns the number itself" do
          expect(calculator.add("5")).to eq(5)
        end
    end

    context "when the input has two numbers separated by a comma" do
        it "returns the sum of the numbers" do
          expect(calculator.add("1,2")).to eq(3)
        end
    end

    context "when the input has multiple numbers separated by commas" do
        it "returns the sum of all the numbers" do
          expect(calculator.add("1,2,3,4,5")).to eq(15)
        end
    end

    context "when the input has numbers separated by newlines" do
        it "returns the sum of all the numbers" do
          expect(calculator.add("1\n2,3")).to eq(6)
        end
    end

    context "when the input specifies a custom delimiter" do
        it "uses the custom delimiter and returns the sum" do
            expect(calculator.add("//;\n1;2;3")).to eq(6)
          end
    
          it "handles multi-character delimiters" do
            expect(calculator.add("//[***]\n1***2***3")).to eq(6)
          end
    
          it "handles multiple custom delimiters" do
            expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
          end
    
          it "handles multiple multi-character delimiters" do
            expect(calculator.add("//[**][%%]\n1**2%%3")).to eq(6)
          end
    end

    context "when the input contains negative numbers" do
        it "raises an exception with the negative numbers listed" do
          expect { calculator.add("1,-2,3,-4") }.to raise_error("Negative numbers not allowed: -2, -4")
        end
  
        it "raises an exception for a single negative number" do
          expect { calculator.add("-5") }.to raise_error("Negative numbers not allowed: -5")
        end
    end

    context "when the input contains invalid formats" do
        it "handles edge cases gracefully" do
          expect(calculator.add("1,,2")).to eq(3)
          expect(calculator.add("1\n\n2")).to eq(3)
        end
    end

    context "when no numbers are provided after the custom delimiter declaration" do
        it "returns 0" do
          expect(calculator.add("//;\n")).to eq(0)
        end
    end

    context "when non-numeric values are included" do
        it "ignores non-numeric values and calculates the sum" do
          expect(calculator.add("1,a,3")).to eq(4)
        end
    end

  end
end