require_relative 'create_student'
require_relative 'create_teacher'

module CreatePerson
  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    person_type = gets.chomp.to_i
    until person_type.between?(1, 2)
      puts 'Invalid input. Please enter the correct number [1/2]: '
      person_type = gets.chomp.to_i
    end

    if person_type == 1
      create_student
    else
      create_teacher
    end
  end
end
