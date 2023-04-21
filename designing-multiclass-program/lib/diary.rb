class Diary
  def initialize
    @diary_entries = []
  end

  def add_diary_entry(entry) 
    @diary_entries << entry
  end

  def all_diary_entries 
    return @diary_entries
  end

  def readable_entries(wpm, minutes)
    @diary_entries.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
  end

  def store_todo 
    # integrated test with Todo
  end

  def all_todo 
    # integrated test with Todo
  end

  def store_contacts 
    # integrated test with Contacts
  end

  def all_contacts 
    # integrated test with Contacts
  end
end