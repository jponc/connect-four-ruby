class Board
  attr_reader :state,
              :rows_count,
              :columns_count

  CELL_WIDTH = 4

  def initialize(state)
    @state = state
    @rows_count = state.count
    @columns_count = state.first.count
  end

  def pick(column, identifier)
    row = next_available_row(column)
    state[row][column] = identifier

    false
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

    puts headers.map { |a| a.map { |i| i.to_s.rjust(CELL_WIDTH) }.join }
    puts state.map { |a| a.map { |i| i.to_s.rjust(CELL_WIDTH) }.join }
  end

  private

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
