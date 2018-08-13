module Strategy
  module Human
    def self.select(board)
      valid_columns = board.valid_columns
      print "Select column #{valid_columns}: "
      gets.chomp.to_i
    end
  end
end
