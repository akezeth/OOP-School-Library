require_relative 'student'
require_relative 'app'

module CreateStudent
  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase
    until parent_permission.eql?('Y') || parent_permission.eql?('N')
      print 'Invalid input. Please enter the correct option [Y/N]: '
      parent_permission = gets.chomp.upcase
    end
    p_permission = parent_permission == 'Y'
    student = Student.new(classroom: 'classroom', age: age, name: name, parent_permission: p_permission)
    @persons << student
    puts 'Student created successfully'
  end
end
