# Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

# EXAMPLE

```ruby
class ToDo
  def initialize(??) # name is a string
    # ...
  end

  def add(todo) # todo is a string
    #  add todo to an array
    # No return value
  end

  def view
    # Throws an exception if no todos are saved
    # Otherwise, returns an array of tasks todos
  end
end
```
## 3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

```ruby

# 1 - creates an empty array 
todo_list = ToDo.new # => todo_list = []

# 2 - view the todo list
todo_list = ToDo.new
todo_list.add("first todo") # => todo_list = ["first todo"]
todo_list.view # => will return the todo_list = ["first todo"]

# 3 - empty string submitted
todo_list = ToDo.new
todo_list.add("") # => fails with an error message

# 4 - add todo to the list
todo_list = ToDo.new
todo_list.add("first todo") # => will edit the todo_list = ["first todo"]

# 5 - adds multiple todos to the list
todo_list = ToDo.new
todo_list.add("first todo") # => will edit the todo_list = ["first todo"]
todo_list.add("second todo") # => will edit the todo_list = ["second todo"]

# 6 - only returns unique todos
todo_list = ToDo.new
todo_list.add("first todo") # => todo_list = ["first todo"]
todo_list.add("first todo") # => todo_list = ["first todo"]
todo_list.view.uniq # => will return the unique todos on the list todo_list = ["first todo"]

# 7 - when we complete a task
todo_list = ToDo.new
todo_list.add("first todo")
todo_list.add("second todo")
todo_list.complete("first todo")
todo_list.view # => ["second todo"]

# 8 - when we complete a task that does not exist
todo_list = ToDo.new
todo_list.add("first todo")
todo_list.complete("second todo")  # => it fails
```

## 4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

