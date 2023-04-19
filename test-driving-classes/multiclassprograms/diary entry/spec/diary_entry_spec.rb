require 'diary_entry'

RSpec.describe DiaryEntry do
  it "creates" do
    entry1 = DiaryEntry.new("title1", "contents1")
    expect(entry1.title).to eq "title1"
    expect(entry1.contents).to eq "contents1"
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