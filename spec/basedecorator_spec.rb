require_relative '../nameable'
require_relative '../basedecorator'

class MockNameable
  attr_accessor :correct_name

  def initialize(correct_name)
    @correct_name = correct_name
  end
end

describe BaseDecorator do
  let(:nameable) { MockNameable.new('John Doe') }
  let(:decorator) { BaseDecorator.new(nameable) }

  describe '#correct_name' do
    it 'returns the correct_name of the nameable object' do
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
