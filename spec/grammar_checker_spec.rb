require 'grammar_checker'

RSpec.describe 'grammar_checker' do
  context 'when passed an empty string' do
    it 'it fails' do
      expect { grammar_checker("") }.to raise_error('Please enter a string')
    end
  end

  context 'when passed senetence with capital letter and full stop' do
    it 'returns true' do
      expect(grammar_checker("Hello world.")).to be true
    end
  end

  context 'when passed sentence all lower case with a full stop' do
    it 'returns false' do
      expect(grammar_checker("hello world.")).to be false
    end
  end

  context ' when passed a sentence starting with a capital letter with no punctuation' do
    it 'returns false' do
      expect(grammar_checker("Hello world")).to be false
    end
  end

  context ' when passed a sentence starting with a capital letter and a exclamation mark' do
    it 'returns true' do
      expect(grammar_checker("Hello world!")).to be true
    end
  end

  context ' when passed a sentence starting with a capital letter and a question mark' do
    it 'returns true' do
      expect(grammar_checker("Hello world?")).to be true
    end
  end
end