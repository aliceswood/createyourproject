require 'count_words'

RSpec.describe 'count_words' do
  context 'when passed a string with 5 words' do
    it 'returns 5' do
      result = count_words('hello world it is me')
      expect(result).to eq(5)
    end
  end

  context 'when passed a single word' do
    it 'returns 1' do
      result = count_words('hello')
      expect(result).to eq(1)
    end
  end

  context 'when passed a long sentence' do
    it 'returns the correct length' do
      result = count_words('hello ' * 1000)
      expect(result).to eq(1000)
    end
  end
end 