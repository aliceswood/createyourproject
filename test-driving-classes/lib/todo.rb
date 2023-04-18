class ToDo
  def initialize
    @todo_list = []
  end 

  def add(todo)
    fail "Please enter a todo." if todo.empty?

    @todo_list << todo
  end

  def view
    return @todo_list.uniq
  end

  def complete(todo)
    fail "This task is not on the list!" unless @todo_list.include?(todo)

    @todo_list.delete(todo)
  end
end 