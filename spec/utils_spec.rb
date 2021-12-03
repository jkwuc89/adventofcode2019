# frozen_string_literal: true

require 'utils'

describe Utils do
  describe '#read_numbers_from' do
    context 'when file does not exist' do
      it 'raises' do
        expect { described_class.read_numbers_from(file: 'does_not_exist.txt') }.to raise_error(Errno::ENOENT)
      end
    end

    context 'when file exists' do
      let(:result) { described_class.read_numbers_from(file: 'input/day_one_puzzle_one.txt') }

      it 'returns array of numbers from the file' do
        expect(result).to be_a(Array)
        expect(result.sample).to be_a(Integer)
        expect(result.length).to eq(100)
      end
    end
  end
end
