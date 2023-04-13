def grammar_checker(text)
  fail "Please enter a string" if text.empty?
  punctuation = [".","?" "!"]
  first_character = text.chars.first
  last_character = text.chars.last
  if first_character == first_character.upcase && punctuation.include?(last_character)
    return true
  else 
    return false
  end
end