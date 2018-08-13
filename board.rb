require_relative 'state_checker'

class Board
  attr_reader :state,
              :rows_count,
              :columns_count

  def initialize(state)
    @state = state
    @rows_count = state.count
    @columns_count = state.first.count
  end

  def pick(column, identifier)
    row = next_available_row(column)
    state[row][column] = identifier

    get_result(row, column)
  end

  def valid_columns
    all_columns.select { |c| valid_column?(c) }
  end

  def print_state
    headers = [[], []]

    columns_count.times do |i|
      headers[0].push(i)
      headers[1].push('-')
    end

    cell_width = 4

    puts headers.map { |a| a.map { |i| i.to_s.rjust(cell_width) }.join }
    puts state.map { |a| a.map { |i| i.to_s.rjust(cell_width) }.join }
    puts
  end

  private

  def get_result(row, column)
    if win?(row, column)
      :win
    elsif valid_columns.empty?
      :draw
    else
      :continue
    end
  end

  def win?(row, column)
    StateChecker.new(state: state, row: row, column: column).win?
  end

  def valid_column?(column)
    state[0][column].nil?
  end

  def next_available_row(column)
    all_rows.to_a.reverse.find do |row|
      state[row][column].nil?
    end
  end

  def all_columns
    last_column = columns_count - 1
    0..last_column
  end

  def all_rows
    last_row = rows_count - 1
    0..last_row
  end
end
