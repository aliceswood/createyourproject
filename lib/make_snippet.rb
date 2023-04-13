def make_snippet(str)
  fail "the string is empty." if str.empty?
  words = str.to_s.split(" ")
  if words.length <= 5
    return str
  else 
    return "#{words[0,5].join(" ")} ..."
  end
end