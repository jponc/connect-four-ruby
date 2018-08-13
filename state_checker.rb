class StateChecker
  attr_reader :state,
              :row,
              :column,
              :rows_count,
              :columns_count,
              :value

  FOUR = 4

  def initialize(options)
    @state = options[:state]

    @row = options[:row]
    @column = options[:column]
    @value = @state[@row][@column]

    @rows_count = @state.count
    @columns_count = @state.first.count
  end

  def win?
    vertical? || horizontal? || diagonal?
  end

  def vertical?
    # NOTE: Just need to get the last 3 rows
    #
    last_row = row + (FOUR - 1)

    return false if last_row >= rows_count

    cell_values =
      (row..last_row).to_a.map do |r|
        state[r][column]
      end

    cell_values.all?(value)
  end

  def horizontal?
    # NOTE: This solution checks on the succeeding right
    # values then left values
    #
    hit_count = 1

    # Right
    #
    counter = 0
    loop do
      counter += 1
      column_check = column + counter
      break if state[row][column_check] != value

      hit_count += 1
      return true if hit_count == FOUR
    end

    # Left
    #
    counter = 0
    loop do
      counter += 1
      column_check = column - counter

      different_value = state[row][column_check] != value
      below_zero = column_check < 0

      break if below_zero || different_value

      hit_count += 1
      return true if hit_count == FOUR
    end

    false
  end

  def diagonal?
    false
  end
end
