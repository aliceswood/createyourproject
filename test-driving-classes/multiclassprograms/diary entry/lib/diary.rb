class Diary
  def initialize
    @diary = []
  end

  def add(entry) 
    @diary << entry
  end

  def all
    return @diary
  end

  def count_words
    return @diary.sum(&:count_words)
  end

  def reading_time(wpm) 
    fail "WPM must be positive" if wpm <= 0
    return (count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end