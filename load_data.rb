require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

module LoadData
  BOOKS_FILE_NAME = './books.json'.freeze
  

  def load_books
    books_list = []
    return books_list unless File.exist?(BOOKS_FILE_NAME)

    books_list = load_data_from_file(BOOKS_FILE_NAME)

    @books = books_list.map do |book|
      Book.new(book['title'], book[author])
    end
  end  
end