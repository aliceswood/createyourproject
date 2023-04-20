require 'todo_list'
require 'todo'

RSpec.describe "ToDo Integration" do
  # context "given some todos" do
  #   xit "adds to the list " do
  #     todo_list = TodoList.new
  #     todo1 = Todo.new("go shopping")
  #     todo2 = Todo.new("go to work")
  #     todo_list.add(todo1)
  #     todo_list.add(todo2) 
  #     expect(todo_list.incomplete).to eq [todo1, todo2]
  #   end
  # end

  context "there is one incomplete task" do 
    it "returns the only incomplete task" do
      todo_list = TodoList.new
      todo1 = Todo.new("todo1")
      todo2 = Todo.new("todo2")
      todo_list.add(todo1)
      todo_list.add(todo2)
      todo1.mark_done!
      expect(todo_list.incomplete).to eq [todo2]
    end
  end

  context " there are two incomplete tasks" do
    it "returns the incomplete list" do
      todo_list = TodoList.new
      todo1 = Todo.new("todo1")
      todo2 = Todo.new("todo2")
      todo3 = Todo.new("todo3")
      todo_list.add(todo1)
      todo_list.add(todo2)
      todo_list.add(todo3)
      todo1.mark_done!
      expect(todo_list.incomplete).to eq [todo2, todo3]
    end
  end


  it "returns the complete list" do
    todo_list = TodoList.new
    todo1 = Todo.new("todo1")
    todo2 = Todo.new("todo2")
    todo_list.add(todo1)
    todo_list.add(todo2)
    todo1.mark_done!
    expect(todo_list.complete).to eq [todo1]
  end

  it "returns the completed list when give_up is run" do
    todo_list = TodoList.new
    todo1 = Todo.new("todo1")
    todo2 = Todo.new("todo2")
    todo3 = Todo.new("todo3")
    todo_list.add(todo1)
    todo_list.add(todo2)
    todo_list.add(todo3)
    expect(todo_list.give_up!).to eq [todo1, todo2, todo3]
  end

  it "returns the empty incompleted list when give_up is run" do
    todo_list = TodoList.new
    todo1 = Todo.new("todo1")
    todo2 = Todo.new("todo2")
    todo3 = Todo.new("todo3")
    todo_list.add(todo1)
    todo_list.add(todo2)
    todo_list.add(todo3)
    todo_list.give_up!
    expect(todo_list.incomplete).to eq []
  end
end