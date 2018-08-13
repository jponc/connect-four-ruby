module Utils
  module Display
    def clear_screen
      system 'clear' or system 'cls'
    end

    def print_board_state(board)
      headers = [[], []]

      board.columns_count.times do |i|
        headers[0].push(i)
        headers[1].push('-')
      end

      cell_width = 4

      puts headers.map { |a| a.map { |i| i.to_s.rjust(cell_width) }.join }
      puts board.state.map { |a| a.map { |i| i.to_s.rjust(cell_width) }.join }
      puts
    end
  end
end
