class StateChecker
  attr_reader :state,
              :row,
              :column,
              :rows_count,
              :columns_count,
              :value

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
    hits = directional_check(:lower)
    hits >= 3
  end

  def horizontal?
    hits = directional_check(:right) + directional_check(:left)
    hits >= 3
  end

  def diagonal?
    hits = directional_check(:upper_right) + directional_check(:lower_left)
    return true if hits >= 3

    hits = directional_check(:upper_left) + directional_check(:lower_right)
    hits >= 3
  end

  def directional_check(direction)
    hit_count = 0
    counter = 1
    column_check = column
    row_check = row

    loop do
      case direction
      when :lower
        row_check += 1
      when :right
        column_check += 1
      when :left
        column_check -= 1
      when :upper_right
        column_check += 1
        row_check -= 1
      when :upper_left
        column_check -= 1
        row_check -= 1
      when :lower_right
        column_check += 1
        row_check += 1
      when :lower_left
        column_check -= 1
        row_check += 1
      end

      row_below_zero = row_check < 0
      column_below_zero = column_check < 0
      row_above_count = row_check >= rows_count
      column_above_count = column_check >= columns_count

      break if column_below_zero || row_below_zero || row_above_count || column_above_count
      break if state[row_check][column_check] != value

      hit_count += 1
    end

    hit_count
  end
end
