require_relative 'utils/display'
require_relative 'game_options/new'
require_relative 'service/board_check'

class GameManager
  include Utils::Display

  def self.new_game
    game = GameOptions::New.load
    new(game).start
  end

  attr_reader :game

  def initialize(game)
    @game = game
  end

  def start
    status = :continue

    loop do
      clear_screen

      print_board
      print_current_player
      row, column = game.select_column
      status = get_status(row, column)

      break if status != :continue
      game.next_player
    end

    clear_screen
    print_board
    print_result(status)
  end

  private

  def print_result(status)
    player = game.current_player
    case status
    when :draw
      puts 'Result: Game is a DRAW'
    when :win
      puts "Result: Player ##{player.number} WON!"
    end
  end

  def get_status(row, column)
    board_check = Service::BoardCheck.new(board: game.board, row: row, column: column)
    board_check.status
  end

  def print_current_player
    player = game.current_player
    puts "--- Player ##{player.number} ---"
  end

  def print_board
    print_board_state(game.board)
  end
end
