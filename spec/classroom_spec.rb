require_relative '../classroom'

RSpec.describe Classroom do
  let(:classroom) { Classroom.new('101') }
  let(:student) { Student.new(classroom: classroom, age: 19, name: 'John') }
  # let(:classroom_student) { Classroom.new('101').add_student(student) }
  describe 'initialize' do
    it 'creates a new classroom' do
      expect(classroom.label).to eq('101')
      expect(classroom.instance_variable_get(:@students)).to eq([])
    end
  end

  describe 'Add students' do
    it 'Adds a new student' do
      classroom_student = classroom.add_students(student)
      expect(classroom_student.students.length).to eq(1)
    end
  end
end
