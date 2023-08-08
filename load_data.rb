require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

module LoadData
  BOOKS_FILE_NAME = './books.json'.freeze
  PEOPLE_FILE_NAME = './people.json'.freeze
  

  def load_books
    books_list = []
    return books_list unless File.exist?(BOOKS_FILE_NAME)

    books_list = load_data_from_file(BOOKS_FILE_NAME)

    @books = books_list.map do |book|
      Book.new(book['title'], book[author])
    end
  end

  def load_people
    people_list = []
    return people_list unless File.exist?(PEOPLE_FILE_NAME)

    people_list = load_data_from_file(PEOPLE_FILE_NAME)
    people_list.each do |person|
      if person['title'] == 'Student'
        student = Student.new(Classroom.new(person['classroom']), person['age'], person['name'], parent_permission: person['parent_permission'])
        student.id = person['id']
        @persons << student
      else
        teacher = Teacher.new(person['specialization'], person['age'], person['name'])
        teacher.id = person['id']
        @persons << teacher
      end
    end
  end

end

  