def todo_checker(text)
  fail "Please enter a string" unless text.is_a?(String)
  fail "Please enter a string" if text.empty?

  todo_text = "#TODO"
  text.include?("#TODO") ? true : false
end
