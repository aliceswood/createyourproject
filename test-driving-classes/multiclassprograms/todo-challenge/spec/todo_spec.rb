require 'todo'

RSpec.describe Todo do
  context "after it has created" do
    it "returns the task" do
      todo = Todo.new("todo1")
      expect(todo.task).to eq "todo1"
    end
  end

  it "marks done" do
    todo = Todo.new("todo1")
    expect(todo.mark_done!).to eq true
  end

  it "checks if the task is done" do
    todo1 = Todo.new("todo1")
    todo2 = Todo.new("todo2")
    todo2.mark_done!
    expect(todo1.done?).to eq false
    expect(todo2.done?).to eq true
  end
end