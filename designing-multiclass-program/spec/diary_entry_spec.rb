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
end