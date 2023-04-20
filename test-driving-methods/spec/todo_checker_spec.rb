require 'todo_checker'

RSpec.describe 'todo_checker' do
  context 'when passed a empty string' do
    it 'fails with and error message' do
      expect { todo_checker("") }.to raise_error("Please enter a string")
    end
  end

  context 'when passed a string including "#TODO"' do
    it 'it to return true' do
      result = todo_checker("#TODO")
      expect(result).to eq true
    end
  end

  context 'when passed a string including "TODO" with no # sign' do
    it 'return false' do
      result = todo_checker("TODO")
      expect(result).to eq false
    end
  end

  context 'when passed a string with text before "#TODO"' do
    it 'return true' do
      result = todo_checker("text before #TODO")
      expect(result).to eq true
    end
  end

  context 'when passed number(s)' do
    it 'fails with and error message' do
      expect { todo_checker(1234) }.to raise_error("Please enter a string")
    end
  end
end