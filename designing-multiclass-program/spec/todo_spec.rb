require 'todo'

RSpec.describe Todo do
  it "returns the task" do
    todo = Todo.new("todo1")
    expect(todo.task).to eq "todo1"
  end

  it "marks as complete" do
    todo = Todo.new("todo1")
    expect(todo.mark_complete!).to eq true
  end

  it "checks if complete" do
    todo1 = Todo.new("todo1")
    todo2 = Todo.new("todo2")
    todo1.mark_complete!
    expect(todo1.complete?).to eq true
    expect(todo2.complete?).to eq false
  end
end