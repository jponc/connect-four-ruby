module DisplayUtils
  def print_intro
    clear_screen

    puts <<~TEXT
      Connect 4 by @jponc
    TEXT
  end

  def print_player_types
    puts <<~TEXT
      Player Types:
      A. Human
      B. Computer (Random)
      C. Computer (AI)

    TEXT
  end

  def get_player_type(number)
    print "Select Type for Player #{number}: "
    selected_type = gets.chomp

    case selected_type.upcase
    when 'A'
      :human
    when 'B'
      :computer_random
    when 'C'
      :computer_ai
    end
  end

  def clear_screen
    # NOTE: Works for both unix and windows systems
    #
    system "clear" or system "cls"
  end
end
