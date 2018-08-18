require_relative '../spec_helper'
require_relative '../../model/game'

describe Model::Game do
  let(:player_1) { Model::Player.new(number: 1, strategy: Strategy::Human) }
  let(:player_2) { Model::Player.new(number: 2, strategy: Strategy::Human) }
  let(:players) { [player_1, player_2] }
  let(:board) { double('Model::Board') }
  let(:current_index) { 0 }

  let!(:game) { described_class.new(board: board, players: players, current_index: current_index) }

  describe '#select_column' do
    let(:column) { 1 }

    before do
      allow(game).to receive(:current_player).and_return(player_1)
    end

    it 'player selects a column from the board' do
      expect(player_1).to receive(:select).with(board).and_return(column)
      expect(board).to receive(:pick).with(column, player_1.number)

      game.select_column
    end

  end

  describe '#next_player' do
    subject { game.next_player }

    context 'current player is the last player' do
      let(:current_index) { 1 }

      it 'resets the current player to the first player' do
        expect { subject }.to change { game.current_index }.from(1).to(0)
      end
    end

    context "current player isn't the last player" do
      let(:current_index) { 0 }

      it 'sets the current player to next player' do
        expect { subject }.to change { game.current_index }.from(0).to(1)
      end
    end
  end

  describe '#current_player' do
    let(:current_index) { 0 }

    subject { game.current_player }

    it 'returns the current player' do
      expect(subject).to eq(player_1)
    end
  end
end
