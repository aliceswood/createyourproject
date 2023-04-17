class GrammarStats
  def initialize
  end

  def check(text)
    fail "Please enter a string to check" if text.empty?

    first_character = text.chars.first
    last_character = text.chars.last
    punctuation = [".", "!", "?"]
    
    first_character == first_character.upcase && punctuation.include?(last_character) ? true : false
  end

  def percentage_good

    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.

    # text checked so far / total text to be checked
    # word by word? or multiple strings?

  end
end