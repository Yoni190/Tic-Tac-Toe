require_relative '../lib/player'

describe Player do
  subject(:player) { described_class.new }
  describe '#increment_score' do
    it 'increments player score' do
      expect { player.increment_score }.to change { player.score }.by(1)
    end
  end
end
