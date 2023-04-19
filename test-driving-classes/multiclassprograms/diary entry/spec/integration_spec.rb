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

  describe "reading_time method" do
    it "fails when wpm is 0" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "contents1")
      diary.add(entry1)
      expect{ diary.reading_time(0) }.to raise_error "WPM must be positive"
    end

    it "calculates the reading time for all entries in diary and wpm fits whole minutes exactly" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "contents1 word word")
      entry2 = DiaryEntry.new("title2", "contents2 word word")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.reading_time(2)).to eq 3
    end

    it "calculates the reading time for all entries in diary where it falls over a minute" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "contents1 word")
      entry2 = DiaryEntry.new("title2", "contents2 word word")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.reading_time(2)).to eq 3
    end
  end
end