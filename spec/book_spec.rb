require 'date'
require_relative '../book'

RSpec.describe Book do
  book = Book.new('A song of ice and fire', 'George R. R. Martin')
  describe 'initialize' do
    it 'creates a new book' do
      expect(book.title).to eq('A song of ice and fire')
      expect(book.author).to eq('George R. R. Martin')
      expect(book.instance_variable_get(:@rentals)).to eq([])
    end
  end

  describe 'Add rental' do
    it 'Adds a new rental' do
      person = Person.new(age: 19, name: 'John')
      date = Date.today
      rental = book.add_rental(person, date)
      expect(rental.date).to eq(Date.today)
    end
  end
end
