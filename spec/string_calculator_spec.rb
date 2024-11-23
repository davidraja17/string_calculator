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

  end
end