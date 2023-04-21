require 'diary_entry'

RSpec.describe DiaryEntry do
  it "returns title" do
    diary_entry_1 = DiaryEntry.new("title1", "contents1")
    expect(diary_entry_1.title).to eq "title1"
  end

  it "returns contents" do
    diary_entry_1 = DiaryEntry.new("title1", "contents1")
    expect(diary_entry_1.contents).to eq "contents1"
  end

  it "counts the words of an entry" do
    diary_entry_1 = DiaryEntry.new("title1", "this is the contents")
    expect(diary_entry_1.count_words).to eq 4
  end

  it "returns the reading time of a diary entry when exactly on the minute" do
    diary_entry_1 = DiaryEntry.new("title1", "this is the contents")
    expect(diary_entry_1.reading_time(2)).to eq 2
  end

  it "returns the reading time of a diary entry when the minutes are not exact" do
    diary_entry_1 = DiaryEntry.new("title1", "also the contents")
    expect(diary_entry_1.reading_time(2)).to eq 2
  end

  it "fails if the wpm is 0" do
    diary_entry_1 = DiaryEntry.new("title1", "also the contents")
    expect { diary_entry_1.reading_time(0) }.to raise_error "WPM must be positive"
  end
end
