require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'rental'
require_relative 'list_books'
require_relative 'list_persons'
require_relative 'create_person'
require_relative 'person_type_selector'
require_relative 'create_student'
require_relative 'create_teacher'
require_relative 'create_book'
require_relative 'create_rental'
require_relative 'list_rentals'

class App
  attr_accessor :books, :students, :teachers, :rental

  include ListBook
  include ListPersons
  include CreatePerson
  include PersonTypeSelector
  include CreateStudent
  include CreateTeacher
  include CreateBook
  include CreateRental
  include ListRentals

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def run(option)
    case option
    when 1
      list_all_books
    when 2
      list_all_persons
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_all_rentals_of_person
    else
      puts 'Thank you for using this app!'
      exit
    end
  end
end
