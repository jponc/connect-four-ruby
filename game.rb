require 'pry'
require_relative 'game_options/new'

class Game
  extend GameOptions::New
  include DisplayUtils

  attr_reader :board,
              :players

  def initialize(options)
    @board = options[:board]
    @players = options[:players]
  end

  def start(current_player)
    loop do
      clear_screen
      print_board_state
      print_current_player_move(current_player)

      column = current_player.select(board)
      done = board.pick(column, current_player.number)

      break if done

      current_player = get_next_player(current_player)
    end
  end

  private

  def get_next_player(current_player)
    current_index = players.find_index(current_player)
    next_index = current_index + 1

    next_index = 0 if players[next_index].nil?

    players[next_index]
  end

  def print_board_state
    board.print_state
  end

  def print_current_player_move(player)
    puts "Player #{player.number}'s turn: "
  end
end
