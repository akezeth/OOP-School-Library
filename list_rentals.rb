require_relative 'app'

module ListRentals
  def list_all_rentals_of_person
    print 'ID of person: '
    person_id = gets.chomp.to_i
    person_data = @rentals.select { |rental| rental.person.id == person_id }

    if person_data.empty?
      puts "Currently, there are no rented books in the system for the person with #{person_id} id"
    else
      puts 'Rentals: '
      person_data.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by \"#{rental.book.author}\""
      end
    end
  end
end
