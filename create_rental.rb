require_relative 'rental'
require_relative 'app'

module CreateRental
  def create_rental
    puts 'Select a book from the following list by number'
    list_all_books
    book_index = gets.chomp.to_i
    until book_index.between?(1, @books.length)
      print 'Invalid input. Please enter the correct number: '
      book_index = gets.chomp.to_i
    end

    puts 'Select a person from the following list by number (not id)'
    list_all_persons
    person_index = gets.chomp.to_i
    until person_index.between?(1, @persons.length)
      print 'Invalid input. Please enter the correct number: '
      person_index = gets.chomp.to_i
    end

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @persons[person_index - 1], @books[book_index - 1])
    @rentals << rental

    puts 'Rental created successfully'
  end
end
