require_relative 'student'
require_relative 'person' 

RSpec.describe Student do
  let(:classroom) { double("Classroom", students: []) }
  subject do
    described_class.new(
      classroom: classroom,
      age: 18,
      name: 'John Doe',
      parent_permission: true
    )
  end

  describe "#initialize" do
    it "sets the attributes correctly" do
      expect(subject.age).to eq(18)
      expect(subject.name).to eq('John Doe')
      expect(subject.instance_variable_get(:@parent_permission)).to eq(true)
      expect(subject.classroom).to eq(classroom)
      expect(subject.title).to eq('Student')
    end
  end

  describe "#play_hooky" do
    it "returns the play hooky message" do
      expect(subject.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe "#classroom=" do
    it "assigns the classroom and adds student to classroom" do
      new_classroom = double("New Classroom", students: [])
      subject.classroom = new_classroom
      expect(subject.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(subject)
    end

    it "does not duplicate students in the classroom" do
      subject.classroom = classroom
      expect(classroom.students).to include(subject)
      subject.classroom = classroom
      expect(classroom.students.count(subject)).to eq(1)
    end
  end  
end
