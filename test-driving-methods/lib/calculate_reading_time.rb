def calculate_reading_time(text)
  (text.split(" ").length / 200.to_f).ceil
end