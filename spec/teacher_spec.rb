require_relative '../teacher'
require_relative '../person'

RSpec.describe Teacher do
  subject do
    described_class.new(
      specialization: 'Mathematics',
      age: 30,
      name: 'Jane Smith'
    )
  end

  describe '#initialize' do
    it 'sets the attributes correctly' do
      expect(subject.age).to eq(30)
      expect(subject.name).to eq('Jane Smith')
      expect(subject.instance_variable_get(:@parent_permission)).to eq(true)
      expect(subject.specialization).to eq('Mathematics')
      expect(subject.title).to eq('Teacher')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(subject.can_use_services?).to eq(true)
    end
  end
end
