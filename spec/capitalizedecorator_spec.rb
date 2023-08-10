require_relative '../basedecorator'
require_relative '../capitalizedecorator'

class MockNameable
  attr_accessor :correct_name

  def initialize(correct_name)
    @correct_name = correct_name
  end
end

describe CapitalizeDecorator do
  let(:nameable) { MockNameable.new('john doe') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the correct_name of the nameable object' do
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end
