require 'diary_entry'

RSpec.describe DiaryEntry do
  it "creates" do
    entry1 = DiaryEntry.new("title1", "contents1")
    expect(entry1.title).to eq "title1"
    expect(entry1.contents).to eq "contents1"
  end
  
  describe "#count_words" do
    it "returns 0 is contents is empty" do
      entry1 = DiaryEntry.new("title1", "")
      expect(entry1.count_words).to eq 0
    end

    context "given an entry where contents is one word long" do
      it "returns the word count" do
        entry1 = DiaryEntry.new("title1", "contents1")
        expect(entry1.count_words).to eq 1
      end
    end

    context "given an entry where contents is multiple words" do
      it "returns the word count" do
        entry1 = DiaryEntry.new("title1", "contents is longer now")
        expect(entry1.count_words).to eq 4
      end
    end
  end

  describe "#reading_time" do
    it "fails if the wpm is 0" do
      entry1 = DiaryEntry.new("title1", "contents")
      expect { entry1.reading_time(0) }.to raise_error "WPM must be positive"
    end
    # remember the case where wpm is 0
    it "returns 0 if the contents is empty" do
      entry1 = DiaryEntry.new("title1", "")
      expect(entry1.reading_time(2)).to eq 0
    end

    it "returns 1 if the contents is one word long" do
      entry1 = DiaryEntry.new("title1", "contents")
      expect(entry1.reading_time(2)).to eq 1
    end


    it "returns the reading time for a diary entry" do
      entry1 = DiaryEntry.new("title1", "the contents is longer now")
      expect(entry1.reading_time(2)).to eq 3
    end
  end

end