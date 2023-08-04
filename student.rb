require_relative 'person'

class Student < Person
  attr_reader :classroom, :title

  def initialize(classroom, age, name, parent_permission: true)
    super(age, name, parent_permission: true)
    @classroom = classroom
    @title = 'Student'
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
