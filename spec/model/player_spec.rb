require_relative '../spec_helper'
require_relative '../../model/player'

describe Model::Player do
  let(:number) { 1 }
  let(:name) { 'Julian' }
  let(:strategy) { double('Strategy::Human') }

  let(:player) { described_class.new(number: number, name: name, strategy: strategy) }

  describe '#select' do
    let(:board) { double('Board') }

    it 'select the board cell depending on the strategy specified' do
      expect(strategy).to receive(:select).with(board)
      player.select(board)
    end
  end
end
