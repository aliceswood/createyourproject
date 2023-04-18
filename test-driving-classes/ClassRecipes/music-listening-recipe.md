# Class Design Recipe

## 1. Describe the Problem
As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

EXAMPLES

```ruby

class MusicTracker
  def initialize() # name is a string
    # ...
  end

  def list
  # empty array - until songs are added
  # when populated will return an array of songs
  end

  def add(song)
    # return nothing
    # push song to the list
  end

end

```
## 3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

EXAMPLE

```ruby
# 1 - creates MusicTracker
music_tracker = MusicTracker.new
#  will print nothing => have an empty array 

# 2 - returns the empty
music_tracker = MusicTracker.new
music_tracker.list  # return => []

# 3 - adding a song to the list
music_tracker = MusicTracker.new
music_tracker.add("Across the Room - Odesza")
music_tracker.list # => ["Across the Room - Odesza"]

# 4 - trying to add a song with an empty string
music_tracker = MusicTracker.new
music_tracker.add("") # => fails with error message saying please write a song name

# 5 - adding multiple songs at once
music_tracker = MusicTracker.new
music_tracker.add("Across the Room - Odesza")
music_tracker.add("Home - Ben Bohmer")
music_tracker.list # => ["Across the Room - Odesza", "Home - Ben Bohmer"]

# 6 - returning only unique songs 
music_tracker = MusicTracker.new
music_tracker.add("Across the Room - Odesza")
music_tracker.add("Across the Room - Odesza")
music_tracker.list # => ["Across the Room - Odesza"]
```

## 4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

