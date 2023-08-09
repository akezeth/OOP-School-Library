require_relative '../person.rb'

RSpec.describe Person do
  subject do
    described_class.new(
      age: 20,
      name: 'John Doe',
      parent_permission: true
    )
  end

  describe '#initialize' do
    it 'sets the attributes correctly' do
      expect(subject.age).to eq(20)
      expect(subject.name).to eq('John Doe')
      expect(subject.instance_variable_get(:@parent_permission)).to eq(true)
      expect(subject.instance_variable_get(:@rentals)).to eq([])
    end
  end

  describe '#can_use_services?' do
    it 'returns true if of age' do
      expect(subject.can_use_services?).to eq(true)
    end

    it 'returns true if not of age but has parent permission' do
      under_age_person = described_class.new(
        age: 15,
        name: 'Underage Person',
        parent_permission: true
      )
      expect(under_age_person.can_use_services?).to eq(true)
    end

    it 'returns false if not of age and no parent permission' do
      under_age_person = described_class.new(
        age: 15,
        name: 'Underage Person',
        parent_permission: false
      )
      expect(under_age_person.can_use_services?).to eq(false)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(subject.correct_name).to eq('John Doe')
    end
  end
end
