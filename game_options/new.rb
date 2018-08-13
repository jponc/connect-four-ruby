require_relative '../strategy/human'
require_relative '../strategy/random'
require_relative '../strategy/minimax'

require_relative '../model/player'
require_relative '../model/board'
require_relative '../model/game'

module GameOptions
  class New
    ROWS = 6
    COLUMNS = 7
    PLAYERS_COUNT = 2

    STRATEGY_MAPPING = {
      'A' => Strategy::Human,
      'B' => Strategy::Random,
    }

    class << self
      def load(players_count: PLAYERS_COUNT, rows: ROWS, columns: COLUMNS)
        board = generate_board(rows, columns)
        players = generate_players(players_count)
        Model::Game.new(board: board, players: players, current_index: 0)
      end

      private

      def generate_board(rows, columns)
        state = Array.new(rows) { Array.new(columns) }
        Model::Board.new(state)
      end

      def generate_players(players_count)
        print_player_strategies
        players_count.times.map do |i|
          number = i + 1;
          generate_player(number)
        end
      end

      def generate_player(number)
        strategy = get_player_strategy(number)
        Model::Player.new(number: number, strategy: strategy)
      end

      def get_player_strategy(number)
        print "Select Strategy for Player ##{number}: "
        STRATEGY_MAPPING[gets.chomp.upcase]
      end

      def print_player_strategies
        puts <<~TEXT
          Player Strategies:
          A. Human
          B. Computer (Random)

        TEXT
      end
    end
  end
end
