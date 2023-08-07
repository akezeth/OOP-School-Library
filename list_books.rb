require_relative 'app'

module ListBook
  def list_all_books
    if @books.empty?
      puts "Currently, we don't have any book in the library."
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: \"#{book.title}\" Author: \"#{book.author}\""
      end
    end
  end
end
