require 'diary'

RSpec.describe Diary do
  it 'it returns empty diary entry list' do
    diary = Diary.new
    expect(diary.all_diary_entries).to eq []
  end

  it "returns empty todo list" do
    diary = Diary.new
    expect(diary.incomplete_todo).to eq []
  end
end