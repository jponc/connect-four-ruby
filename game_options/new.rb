require_relative '../strategy/human'
require_relative '../strategy/random'
require_relative '../strategy/minimax'

require_relative '../player'
require_relative '../board'
require_relative '../display_utils'

module GameOptions
  module New
    include DisplayUtils

    DEFAULT_ROWS = 6
    DEFAULT_COLUMNS = 7
    DEFAULT_PLAYERS_COUNT = 2

    PLAYER_STRATEGY_MAP = {
      human: Strategy::Human,
      computer_random: Strategy::Random,
      computer_ai: Strategy::Minimax,
    }

    def new_game(options = {})
      players_count = options[:players_count] || DEFAULT_PLAYERS_COUNT
      rows = options[:rows] || DEFAULT_ROWS
      columns = options[:columns] || DEFAULT_COLUMNS

      print_intro

      board = generate_board(rows, columns)
      players = generate_players(players_count)

      game = new(
        board: board,
        players: players
      )

      # NOTE: Start the game using the first player
      #
      game.start(players.first)
    end

    def generate_board(rows, columns)
      state = Array.new(rows) { Array.new(columns) }
      Board.new(state)
    end

    def generate_players(players_count)
      print_player_types

      players_count.times.map do |i|
        number = i + 1;
        generate_player(number)
      end
    end

    def generate_player(number)
      type = get_player_type(number)
      strategy = PLAYER_STRATEGY_MAP[type]

      Player.new(number: number, strategy: strategy)
    end
  end
end
