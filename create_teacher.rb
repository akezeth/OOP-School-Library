require_relative 'teacher'
require_relative 'app'

module CreateTeacher
  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization: specialization, age: age, name: name)
    @persons << teacher
    puts 'Teacher created successfully'
  end
end
