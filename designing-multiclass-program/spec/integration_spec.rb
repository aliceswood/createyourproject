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