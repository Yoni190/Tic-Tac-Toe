require_relative '../lib/board'

describe Board do
  describe '#mark_the_board' do
    subject(:my_board) { described_class.new }
    it 'marks the board' do
      choice = '5'
      mark = 'x'
      board = my_board.board
      expect { my_board.mark_the_board(choice, mark) }.to change { board }.to include(mark)
    end
  end
end
