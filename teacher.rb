require_relative 'person'

class Teacher < Person
  attr_reader :title

  def initialize(specialization:, age:, name: 'unknown')
    super(age: age, name: name, parent_permission: true)
    @specialization = specialization
    @title = 'Teacher'
  end

  def can_use_services?
    true
  end
end
