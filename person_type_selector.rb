require_relative 'create_student'
require_relative 'create_teacher'

module PersonTypeSelector
  def person_type_selector(person_type)
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    end
  end
end
