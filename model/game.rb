module Model
  class Game
    attr_reader :board
    attr_reader :players

    def initialize(options)
      @board = options[:board]
      @players = options[:players]
      @current_index = options[:current_index]
    end

    def select_column
      column = current_player.select(board)
      row, column = board.pick(column, current_player.number)
    end

    def next_player
      @current_index = @current_index + 1
      @current_index = 0 if players[@current_index].nil?
    end

    def current_player
      players[@current_index]
    end
  end
end
