require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

module LoadData
  BOOKS_FILE_NAME = './books.json'.freeze
  PEOPLE_FILE_NAME = './people.json'.freeze
  RENTALS_FILE_NAME = './rentals.json'.freeze

  def load_data_from_file(file_name)
    file = File.read(file_name)
    JSON.parse(file)
  end

  def load_books
    books_list = []
    return books_list unless File.exist?(BOOKS_FILE_NAME)

    books_list = load_data_from_file(BOOKS_FILE_NAME)

    @books = books_list.map do |book|
      Book.new(book['title'], book['author'])
    end
  end

  def load_people
    people_list = []
    return people_list unless File.exist?(PEOPLE_FILE_NAME)

    people_list = load_data_from_file(PEOPLE_FILE_NAME)
    people_list.each do |person|
      if person['title'] == 'Student'
        student = Student.new(classroom: Classroom.new(person['classroom']), age: person['age'], name: person['name'],
                              parent_permission: person['parent_permission'])
        student.id = person['id']
        @persons << student
      else
        teacher = Teacher.new(specialization: person['specialization'], age: person['age'], name: person['name'])
        teacher.id = person['id']
        @persons << teacher
      end
    end
  end

  def load_rentals
    rentals_list = []
    return rentals_list unless File.exist?(RENTALS_FILE_NAME)

    rentals_list = load_data_from_file(RENTALS_FILE_NAME)
    rentals_list.each do |rental|
      book = Book.new(rental['book']['title'], rental['book']['author'])
      person = create_rental_person(rental['person'])
      @rentals << Rental.new(rental['date'], person, book)
    end
  end

  def create_rental_person(person)
    if person['title'] == 'Student'
      student = Student.new(classroom: Classroom.new(person['classroom']), age: person['age'], name: person['name'],
                            parent_permission: person['parent_permission'])
      student.id = person['id'].to_i
      student
    else
      teacher = Teacher.new(specialization: person['specialization'], age: person['age'], name: person['name'])
      teacher.id = person['id'].to_i
      teacher
    end
  end
end
