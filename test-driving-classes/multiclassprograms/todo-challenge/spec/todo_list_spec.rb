require 'todo_list'

RSpec.describe TodoList do
  it "creates" do
    todo_list = TodoList.new
    expect(todo_list.incomplete).to eq []
  end

  it "adds" do
    todo_list = TodoList.new
    expect(todo_list.add("todo1")).to eq ["todo1"]
  end
end