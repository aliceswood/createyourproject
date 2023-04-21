require 'diary'
require 'diary_entry'
require 'contacts'
require 'todo'

# # tests to do tests add and all for diary entries
# diary = Diary.new
# diary_entry_1 = DiaryEntry.new("title1", "contents1")
# diary_entry_2 = DiaryEntry.new("title2", "contents2")
# diary.add_diary_entry(diary_entry_1) 
# diary.add_diary_entry(diary_entry_2) # => all_diary_entry = [diary_entry_1, diary_entry_2]


RSpec.describe 'integration' do
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
end