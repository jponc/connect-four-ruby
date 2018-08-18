require_relative '../spec_helper'
require_relative '../../strategy/random'

describe Strategy::Random do
  describe '.select' do
    let(:valid_columns) { ['1', '2'] }
    let(:board) { double('Model::Board') }

    before do
      allow(board).to receive(:valid_columns).and_return(valid_columns)
    end

    subject { described_class.select(board) }

    it 'selects randomly based on board valid columns' do
      expect(valid_columns).to receive(:sample)
      subject
    end
  end
end
