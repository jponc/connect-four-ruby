module Strategy
  module Random
    def self.select(board)
      valid_columns = board.valid_columns
      valid_columns.sample
    end
  end
end
