require 'diary'
require 'diary_entry'
require 'contacts'
require 'todo'

RSpec.describe 'Diary Entry integration' do
  context "given some diary entries" do
    it "adds them to the diary list" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("title1", "contents1")
      diary_entry_2 = DiaryEntry.new("title2", "contents2")
      diary.add_diary_entry(diary_entry_1)
      diary.add_diary_entry(diary_entry_2)
      expect(diary.all_diary_entries).to eq [diary_entry_1, diary_entry_2]
    end
  end

  context "with multiple diary entries added" do
    it "returns the possible entries to read in a given time" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("title1", "contents")
      diary_entry_2 = DiaryEntry.new("title2", "also contents")
      diary_entry_3 = DiaryEntry.new("title2", "this is the contents")
      diary.add_diary_entry(diary_entry_1)
      diary.add_diary_entry(diary_entry_2)
      diary.add_diary_entry(diary_entry_3)
      expect(diary.readable_entries(2, 1)).to eq [diary_entry_1, diary_entry_2]
    end
  end
end

RSpec.describe "Todo Integration" do
  context "it gets given some todos" do
    it "stores the todos in a list as incomplete" do
      diary = Diary.new
      todo1 = Todo.new("todo1")
      todo2 = Todo.new("todo2")
      diary.store_todo(todo1)
      diary.store_todo(todo2)
      expect(diary.incomplete_todo).to eq [todo1, todo2]
    end
  end

  context "when todos are marked as complete" do
    it "will return the list of only tasks that have been completed" do
      diary = Diary.new
      todo1 = Todo.new("todo1")
      todo2 = Todo.new("todo2")
      diary.store_todo(todo1)
      diary.store_todo(todo2)
      todo1.mark_complete!
      expect(diary.completed_todo).to eq [todo1]
    end
  end
end