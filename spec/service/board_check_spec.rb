require_relative '../spec_helper'
require_relative '../../service/board_check'

describe Service::BoardCheck do
  let(:rows_count) { 6 }
  let(:columns_count) { 7 }
  let(:state) { Array.new(rows_count) { Array.new(columns_count) } }
  let(:board) do
    Model::Board.new(
      state: state,
      rows_count: rows_count,
      columns_count: columns_count
    )
  end

  let(:row) { 1 }
  let(:column) { 1 }

  let(:service) { described_class.new(board: board, row: row, column: column) }

  describe '#status' do
    let(:win) { false }
    let(:draw) { false }

    before do
      allow(service).to receive(:win?).and_return(win)
      allow(service).to receive(:draw?).and_return(draw)
    end

    subject { service.status }

    context 'current player won' do
      let(:win) { true }

      it { is_expected.to eq(:win) }
    end

    context "it's a draw" do
      let(:draw) { true }

      it { is_expected.to eq(:draw) }
    end

    context "game isn't over yet" do
      it { is_expected.to eq(:continue) }
    end
  end

  describe '#win?' do
    let(:by_vertical) { false }
    let(:by_horizontal) { false }
    let(:by_diagonal) { false }


    before do
      allow(service).to receive(:vertical?).and_return(by_vertical)
      allow(service).to receive(:horizontal?).and_return(by_horizontal)
      allow(service).to receive(:diagonal?).and_return(by_diagonal)
    end

    subject { service.win? }

    context 'win by vertical' do
      let(:by_vertical) { true }
      it { is_expected.to eq(true) }
    end

    context 'win by horizontal' do
      let(:by_horizontal) { true }
      it { is_expected.to eq(true) }
    end

    context 'win by diagonal' do
      let(:by_diagonal) { true }
      it { is_expected.to eq(true) }
    end

    context "didn't win" do
      it { is_expected.to eq(false) }
    end
  end

  describe '#draw?' do
    before do
      allow(board).to receive(:valid_columns).and_return(valid_columns)
    end

    subject { service.draw? }

    context 'still has valid columns' do
      let(:valid_columns) { ['1'] }
      it { is_expected.to eq(false) }
    end

    context 'no more valid columns' do
      let(:valid_columns) { [] }
      it { is_expected.to eq(true) }
    end
  end
end
