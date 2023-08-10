require_relative '../rental'

describe 'Rental' do
  before :all do
    @date = '22/08/08'
    @person = Person.new(age: 19, name: 'John')
    @book = Book.new('A song of ice and fire', 'George R. R. Martin')
    @rental = Rental.new(@date, @person, @book)
  end

  it 'has date, book and person attributes' do
    expect(@rental).to have_attributes(date: '22/08/08')
    expect(@rental.book).to eq(@book)
    expect(@rental.person).to eq(@person)
  end

  it 'should add rental to book and person rentals' do
    expect(@book.rentals).to include(@rental)
    expect(@person.rentals).to include(@rental)
  end
end
