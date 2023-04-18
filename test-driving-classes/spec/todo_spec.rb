require 'todo'

RSpec.describe ToDo do
  context "with no entries" do
    it "has an empty list" do
      todo_list = ToDo.new
      expect(todo_list.view).to eq []
    end
  end

  context "when viewing the todo list" do
    it "shows the todos saved" do
      todo_list = ToDo.new
      expect(todo_list.view).to eq []
    end
  end

  context "when passed an empty string" do
    it "fails with fail message" do
      todo_list = ToDo.new
      expect { todo_list.add("") }.to raise_error "Please enter a todo."
    end
  end

  context "when passed a string" do
    it "adds the todo to the list" do
      todo_list = ToDo.new
      todo_list.add("first todo")
      expect(todo_list.view).to eq ["first todo"]
    end
  end

  context "when passed multiple todos" do
    it "adds multiple todos to the list" do
      todo_list = ToDo.new
      todo_list.add("first todo")
      todo_list.add("second todo")
      expect(todo_list.view).to eq ["first todo", "second todo"]
    end
  end

  context "when passed duplicate todos" do
    it "returns unique todos only" do
      todo_list = ToDo.new
      todo_list.add("first todo")
      todo_list.add("first todo")
      expect(todo_list.view).to eq ["first todo"]
    end
  end

  context "when we complete a task" do
    it "removes it from the list" do
      todo_list = ToDo.new
      todo_list.add("first todo")
      todo_list.add("second todo")
      todo_list.complete("first todo")
      expect(todo_list.view).to eq ["second todo"]
    end
  end

  context "when we try to remove a task that does not exist" do
    it "fails" do
      todo_list = ToDo.new
      todo_list.add("first todo")
      expect { todo_list.complete("second todo") }.to raise_error "This task is not on the list!"
    end
  end
end