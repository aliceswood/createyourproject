require 'todo_list'
require 'todo'

RSpec.describe "ToDo Integration" do
  context "given a todo" do
    it "adds the todo to the todo list " do
      todo_list = TodoList.new
      todo = Todo.new("first todo")
      expect(todo_list.add(todo)).to eq [todo]
    end
  end
end