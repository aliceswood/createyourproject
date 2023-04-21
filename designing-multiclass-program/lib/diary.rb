class Diary
  def initialize
    @diary_entries = []
    @todo_list = []
    @contacts = []
  end

  def add_diary_entry(entry) 
    @diary_entries << entry
    store_contact(entry.contents)
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

  def store_contact(text)
    matches = text.scan(/[0-9]{11}/)
    matches.each do |number_to_store|
      @contacts << number_to_store
    end
  end

  def all_contacts
    return @contacts
  end
end