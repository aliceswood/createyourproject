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

  describe "#find_best_entry_for_reading_time" do
    it "fails when the wpm is 0" do
      diary = Diary.new
        entry1 = DiaryEntry.new("title1", "contents1 word")
        diary.add(entry1)
        expect { diary.find_best_entry_for_reading_time(0, 1) }.to raise_error "WPM must be positive"
    end

    context "when we have one entry and it is readable within the time" do
      it "should return the entry" do
        diary = Diary.new
        entry1 = DiaryEntry.new("title1", "contents1 word")
        diary.add(entry1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq entry1
      end
    end

    context "where we have one entry and it is unreadable within the time" do
      it "returns nil" do
        diary = Diary.new
        entry1 = DiaryEntry.new("title1", "the contents is much longer here")
        diary.add(entry1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq nil
      end
    end

    context "where we have multiple entries " do
      it "returns the longest readable entry" do
        diary = Diary.new
        best_entry = DiaryEntry.new("title1", "longer contents")
        diary.add(DiaryEntry.new("title1", "contents"))
        diary.add(best_entry)
        diary.add(DiaryEntry.new("title1", "some longer contents"))
        diary.add(DiaryEntry.new("title1", "some more longer contents"))
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq best_entry
      end
    end

  end
end