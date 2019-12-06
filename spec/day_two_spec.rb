require 'day_two'
require 'utils'

describe DayTwo do
  let(:day_two) { described_class.new }

  context "#parse_program" do
    context "example input" do
      it { expect(day_two.parse_program(:program => "1,9,10,3,2,3,11,0,99,30,40,50")).to eq([1,9,10,3,2,3,11,0,99,30,40,50]) }
    end

    context "puzzle input" do
      let(:program) { File.read("input/day_two.txt") }

      it { expect(day_two.parse_program(:program => program)).to eq([
        1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,6,1,19,1,19,10,23,2,13,23,27,1,5,27,31,2,6,31,35,1,6,35,39,2,39,9,43,1,5,43,47,1,13,47,51,1,10,51,55,2,55,10,59,2,10,59,63,1,9,63,67,2,67,13,71,1,71,6,75,2,6,75,79,1,5,79,83,2,83,9,87,1,6,87,91,2,91,6,95,1,95,6,99,2,99,13,103,1,6,103,107,1,2,107,111,1,111,9,0,99,2,14,0,0
      ]) }
    end
  end

  context "#run_program" do
    let(:result) { day_two.run_program(:program => program) }

    context "when first op code is end program" do
      let(:program) { "99" }

      it "returns parsed program with unchanged values" do
        expect(result).to eq([99])
      end
    end

    context "when op code is invalid" do
      let(:program) { "100,1,2,3"}

      it "raises" do
        expect{ result }.to raise_error(DayTwo::InvalidOpCodeError)
      end
    end

    context "simple example programs" do
      context "1,0,0,0,99" do
        let(:program) { "1,0,0,0,99" }

        it { expect(result).to eq([2,0,0,0,99])}
      end

      context "1,0,0,0,99" do
        let(:program) { "1,0,0,0,99" }

        it { expect(result).to eq([2,0,0,0,99])}
      end

      context "2,3,0,3,99" do
        let(:program) { "2,3,0,3,99" }

        it { expect(result).to eq([2,3,0,6,99])}
      end

      context "2,4,4,5,99,0" do
        let(:program) { "2,4,4,5,99,0" }

        it { expect(result).to eq([2,4,4,5,99,9801])}
      end

      context "1,1,1,4,99,5,6,0,99" do
        let(:program) { "1,1,1,4,99,5,6,0,99" }

        it { expect(result).to eq([30,1,1,4,2,5,6,0,99])}
      end

      context "1,9,10,3,2,3,11,0,99,30,40,50" do
        let(:program) { "1,9,10,3,2,3,11,0,99,30,40,50" }

        it { expect(result).to eq([3500,9,10,70,2,3,11,0,99,30,40,50])}
      end
    end

    context "with puzzle input" do
      let(:program) { File.read("input/day_two.txt") }
      let(:result) { day_two.run_program(:program => program, :is_running_puzzle_input => true) }

      it { expect(result[0]).to eq(4138687) }
    end
  end
end
