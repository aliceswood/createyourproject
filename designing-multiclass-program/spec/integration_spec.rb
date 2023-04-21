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

RSpec.describe "Contacts Integration" do
  context "it extracts number when it is the only information in a string" do
    it "saves them to the list" do
      diary = Diary.new
      diary.store_contact("07000000001")
      diary.store_contact("07000000002")
      expect(diary.all_contacts).to eq ["07000000001", "07000000002"]
    end
  end

  context "when in a string of words" do
    it "extracts the numbers and saves them as a list" do
      diary = Diary.new
      contact1 = Contact.new
      diary.store_contact("07000000002 text hello")
      expect(diary.all_contacts).to eq ["07000000002"]
    end
  end

  context "when there are two number in a string" do
    it "returns both numbers as separate entries in the list" do
      diary = Diary.new
      contact1 = Contact.new
      diary.store_contact("07000000002 middle text 07000000001")
      expect(diary.all_contacts).to eq ["07000000002", "07000000001"]
    end
  end

  it "extracts numbers from all the diary entries" do
    diary = Diary.new
    diary_entry = DiaryEntry.new("title", "07000000002 middle text 07000000001")
    diary.add_diary_entry(diary_entry)
    expect(diary.all_contacts).to eq ["07000000002", "07000000001"]
  end
end