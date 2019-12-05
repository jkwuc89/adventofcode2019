require 'day_one'
require 'utils'

describe DayOne do
  let(:day_one) { described_class.new }

  context "#calculate_fuel_for_module" do
    context "example input" do
      it { expect(day_one.calculate_fuel_for_mass(:mass => 12)).to eq(2) }
      it { expect(day_one.calculate_fuel_for_mass(:mass => 13)).to eq(2) }
      it { expect(day_one.calculate_fuel_for_mass(:mass => 1969)).to eq(654) }
      it { expect(day_one.calculate_fuel_for_mass(:mass => 100756)).to eq(33583) }
    end
  end

  context "#calculate_fuel_for_module_mass" do
    context "example input" do
      it { expect(day_one.calculate_fuel_for_module_mass(:module_mass => 14)).to eq(2) }
      it { expect(day_one.calculate_fuel_for_module_mass(:module_mass => 1969)).to eq(966) }
      it { expect(day_one.calculate_fuel_for_module_mass(:module_mass => 100756)).to eq(50346) }
    end
  end

  context "#puzzle_one_sum_fuel_for_all_modules" do
    context "when there are no modules" do
      it "returns 0" do
        expect(day_one.puzzle_one_sum_fuel_for_all_modules(:modules => [])).to eq(0)
      end
    end

    context "with puzzle input" do
      let(:modules) { Utils.read_numbers_from(:file => "input/day_one.txt") }
      let(:result) { day_one.puzzle_one_sum_fuel_for_all_modules(:modules => modules) }

      it "returns correct sum" do
        expect(result).to eq(3152038)
      end
    end
  end

  context "#puzzle_two_sum_fuel_for_all_modules" do
    context "when there are no modules" do
      it "returns 0" do
        expect(day_one.puzzle_two_sum_fuel_for_all_modules(:modules => [])).to eq(0)
      end
    end

    context "with puzzle input" do
      let(:modules) { Utils.read_numbers_from(:file => "input/day_one.txt") }
      let(:result) { day_one.puzzle_two_sum_fuel_for_all_modules(:modules => modules) }

      it "returns correct sum" do
        expect(result).to eq(4725210)
      end
    end
  end
end
