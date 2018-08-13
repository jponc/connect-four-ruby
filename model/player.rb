module Model
  class Player
    attr_reader :number
    attr_reader :name
    attr_reader :strategy

    def initialize(options)
      @number = options[:number]
      @name = options[:name]
      @strategy = options[:strategy]
    end

    def select(board)
      strategy.select(board)
    end
  end
end
