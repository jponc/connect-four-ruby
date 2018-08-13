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
    last_row = row + 3

    return false if last_row >= rows_count

    cell_values =
      (row..last_row).to_a.map do |r|
        state[r][column]
      end

    cell_values.all?(value)
  end

  def horizontal?
    false
  end

  def diagonal?
    false
  end
end
