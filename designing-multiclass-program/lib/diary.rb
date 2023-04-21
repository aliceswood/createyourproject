class Diary
  def initialize
    @diary_entries = []
    @todo_list = []
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

  def store_todo(todo)
    @todo_list << todo
  end

  def completed_todo 
    return @todo_list.select do |task|
        task.complete? == true
    end
  end

  def incomplete_todo
    return @todo_list.select do |task|
        task.complete? == false
    end
  end

  def store_contacts 
    # integrated test with Contacts
  end

  def all_contacts 
    # integrated test with Contacts
  end
end