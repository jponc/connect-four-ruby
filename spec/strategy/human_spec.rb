require_relative '../spec_helper'
require_relative '../../strategy/human'

describe Strategy::Human do
  describe '.is_valid?' do
    let(:valid_columns) { ['1', '2'] }

    subject { described_class.is_valid?(valid_columns, selected) }

    context 'selected is valid' do
      let(:selected) { '1' }
      it { is_expected.to eq(true) }
    end

    context 'selected is invalid' do
      let(:selected) { '5' }
      it { is_expected.to eq(false) }
    end
  end
end
