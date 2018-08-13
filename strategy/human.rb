module Strategy
  module Human
    def self.select(board)
      loop do
        valid_columns = board.valid_columns.map(&:to_s)

        puts "Valid Columns: #{valid_columns}"
        print "Selected: "
        selected = gets.chomp

        return selected.to_i if is_valid?(valid_columns, selected)

        puts 'You selected an invalid column. Try again.'
      end
    end

    def self.is_valid?(valid_columns, selected)
      valid_columns.include?(selected)
    end
  end
end
