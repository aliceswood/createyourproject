class GrammarStats
  def initialize
    @passed_checks = 0
    @failed_checks = 0
    @total_checks = 0
  end

  def check(text)
    fail "Please enter a string to check" if text.empty?
    
    @total_checks += 1
    first_character = text.chars.first
    last_character = text.chars.last
    punctuation = [".", "!", "?"]
    if first_character == first_character.upcase && punctuation.include?(last_character) == true
      @passed_checks += 1
      return true
    else
      @failed_checks += 1
      return false
    end
  end

  def percentage_good
    if @passed_checks == 0 && @failed_checks > 0
      return 0
    elsif @failed_checks == 0 && @passed_checks > 0
      return 100
    else
    ((@passed_checks.to_f / @total_checks.to_f) * 100).to_i
    end
  end
end