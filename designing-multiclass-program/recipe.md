# Multi-Class Planned Design Recipe
## 1. Describe the Problem
As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com



```ruby
DiaryMethods
class Diary
  def initialize
  # DONE
  end

  def add_diary_entry #integrated test with DiaryEntry
  # DONE
  end

  def all_diary_entries #integrated test with DiaryEntry
  # DONE
  end 


  def chose_entry(wpm, minutes) #integrated test with DiaryEntry
  # DONE
  end

  def store_todo # integrated test with Todo
  end

  def all_todo # integrated test with Todo
  end

  def store_contacts # integrated test with Contacts
  end

  def all_contacts # integrated test with Contacts
  end
end

DiaryEntryMethods

class DiaryEntry
  def initialize
  # DONE
  end

  def title
  # DONE
  end

  def contents
  # DONE
  end

  def count_words
  end

  def reading_time(wpm)
  end
end

TodoMethods

class Todo
  def view
  end

  def mark_complete!
  end

  def complete?
  end
end

MobileNumberMethods
class Contacts
  def add
  end

  def list
  end
end

```
