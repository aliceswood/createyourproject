class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo) 
    @todo_list << todo
  end

  def incomplete
    # we want to return every todo on the todo list that has a done value of false
    incomplete = []
    @todo_list.each  { |task| incomplete << task if  task.done? == false}
    incomplete
  end
  
  

  def complete
    complete = []
    @todo_list.each  { |task| complete << task if  task.done? == true}
    complete
  end

  def give_up!
    give_up = []
    @todo_list.each { |task| task.mark_done! }
  end
end