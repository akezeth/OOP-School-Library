require_relative 'person'

module listPersons
  def list_all_persons
    if @persons.empty?
      puts "Currently, we don't have any person"
    else
      @persons.each_with_index do |person, index|
        puts "#{index + 1}) [#{person.title}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end
end
