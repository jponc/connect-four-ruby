require 'pry'
require_relative 'game_options/new'

class Game
  extend GameOptions::New

  attr_reader :board,
              :players,
              :current_player

  def initialize(options)
    @board = options[:board]
    @players = options[:players]
    @current_player = options[:current_player]
  end

  def start
    
  end
end
