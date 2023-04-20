require 'todo'

RSpec.describe Todo do
  it "creates" do
    todo = Todo.new("todo1")
    expect(todo.task).to eq "todo1"
  end
end