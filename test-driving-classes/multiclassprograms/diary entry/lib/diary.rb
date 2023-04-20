class Diary
  def initialize
    @diary = []
  end

  def add(entry)
    @diary << entry
  end

  def all
    @diary
  end

  def count_words
    @diary.sum(&:count_words)
  end

  def reading_time(wpm)
    raise 'WPM must be positive' if wpm <= 0

    (count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    readable_entries(wpm, minutes).max_by(&:count_words)
  end

  private

  def readable_entries(wpm, minutes)
    @diary.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
  end
end
