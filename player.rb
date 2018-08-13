class Player
  def initialize(options)
    @number = options[:number]
    @name = options[:name]
    @strategy = options[:strategy]
  end

  def pick(board)
    strategy.pick(board)
  end
end
