require 'day_two'
require 'utils'

describe DayTwo do
  let(:day_two) { described_class.new }

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
      let(:result) { day_two.run_program(:program => program, :noun => 12, :verb => 2) }

      it { expect(result[0]).to eq(4138687) }
    end
  end

  context "#determine_noun_and_verb_for_output" do
    let(:result) { day_two.determine_noun_and_verb_for_output(:program => program, :desired_output => desired_output) }

    context "with output from puzzle 1" do
      let(:program) { File.read("input/day_two.txt") }
      let(:desired_output) { 4138687 }

      it { expect(result).to eq({:noun => 12, :verb => 2}) }
    end

    context "with desired output for puzzle 2" do
      let(:program) { File.read("input/day_two.txt") }
      let(:desired_output) { 19690720 }

      it { expect(result).to eq({:noun => 66, :verb => 35}) }
    end
  end

  context "#get_calculated_noun_and_verb_for" do
    let(:result) { day_two.get_calculated_noun_and_verb_for(:program => program, :desired_output => desired_output) }

    context "with output from puzzle 1" do
      let(:program) { File.read("input/day_two.txt") }
      let(:desired_output) { 4138687 }

      it { expect(result).to eq(12 * 100 + 2) }
    end

    context "with desired output for puzzle 2" do
      let(:program) { File.read("input/day_two.txt") }
      let(:desired_output) { 19690720 }

      it { expect(result).to eq(66 * 100 + 35) }
    end
  end
end
