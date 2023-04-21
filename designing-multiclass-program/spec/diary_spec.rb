require 'diary'

RSpec.describe Diary do
  it 'it creates' do
    diary = Diary.new
    expect(diary.all_diary_entries).to eq []
  end
end