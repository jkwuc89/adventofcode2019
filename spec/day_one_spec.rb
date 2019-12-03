require 'day_one'
require 'utils'

describe DayOne do
  let(:day_one) { described_class.new }

  context "#calculate_fuel_for_module" do
    context "example input" do
      it { expect(day_one.calculate_fuel_for_module(:mass => 12)).to eq(2) }
      it { expect(day_one.calculate_fuel_for_module(:mass => 13)).to eq(2) }
      it { expect(day_one.calculate_fuel_for_module(:mass => 1969)).to eq(654) }
      it { expect(day_one.calculate_fuel_for_module(:mass => 100756)).to eq(33583) }
    end
  end

  context "#sum_fuel_for_all_modules" do
    context "when there are no modules" do
      it "returns 0" do
        expect(day_one.sum_fuel_for_all_modules(:modules => [])).to eq(0)
      end
    end

    context "with puzzle input" do
      let(:modules) { Utils.read_numbers_from(:file => "input/day_one_puzzle_one.txt") }
      let(:result) { day_one.sum_fuel_for_all_modules(:modules => modules) }

      it "returns correct sum" do
        expect(result).to eq(3152038)
      end
    end
  end
end
