class StateChecker
  attr_reader :state,
              :row,
              :column

  def initialize(options)
    @state = options[:state]
    @row = options[:row]
    @column = options[:column]
  end

  def win?
    false
  end
end
