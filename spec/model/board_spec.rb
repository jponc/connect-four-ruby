require_relative '../spec_helper'
require_relative '../../model/board'

describe Model::Board do
  let!(:state) do
    [
      [nil, 2, nil],
      [nil, 1, 1]
    ]
  end

  let!(:board) { described_class.new(state) }

  describe '#pick' do
    let(:new_state) do
      [
        [nil, 2, 2],
        [nil, 1, 1]
      ]
    end

    subject { board.pick(2, 2) }

    it 'updates the state of the board' do
      subject
      expect(board.state).to eq(new_state)
    end
  end

  describe '#valid_columns' do
    subject { board.valid_columns }
    it { is_expected.to eq([0, 2]) }
  end
end
