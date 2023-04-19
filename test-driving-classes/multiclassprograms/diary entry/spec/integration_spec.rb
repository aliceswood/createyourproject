require "diary"
require "diary_entry"

RSpec.describe "Diary Integration" do
  context "given an entry" do
    it "returns the entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "contents1")
      entry2 = DiaryEntry.new("title2", "contents2")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.all).to eq [entry1, entry2]
    end
  end

  context "given multiple entries" do
    it "returns the total word count" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "contents1 word")
      entry2 = DiaryEntry.new("title2", "contents2")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.count_words).to eq 3
    end
  end
end