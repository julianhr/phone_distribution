require 'rails_helper'

RSpec.describe State, type: :model do
  let(:valid_attributes) do
    {
      code: 'CA',
      name: 'California'
    }
  end

  it 'is valid if all attributes are correct' do
    state = State.new valid_attributes
    expect(state).to be_valid
  end

  describe '#code' do
    context 'should fail if' do
      let(:state) { State.new valid_attributes }
  
      it 'is undefined' do
        state.code = nil
        expect(state).to be_invalid
        expect(state.errors[:code]).not_to be_empty
      end
      
      it 'is not 2 characters long' do
        state.code = 'CAA'
        expect(state).to be_invalid
        expect(state.errors[:code]).not_to be_empty
        state.code = 'C'
        expect(state).to be_invalid
        expect(state.errors[:code]).not_to be_empty
      end

      it 'is not unique' do
        state1 = State.create! valid_attributes
        other_state = State.new code: state1.code, name: 'Narnia'
        expect(other_state).to be_invalid
        expect(other_state.errors[:code]).not_to be_empty
      end
    end
  end

  describe '#name' do
    context 'should fail if' do
      let(:state) { State.new valid_attributes }

      it 'is undefined' do
        state.name = nil
        expect(state).to be_invalid
        expect(state.errors[:name]).not_to be_empty
      end

      it 'is not unique' do
        state1 = State.create! valid_attributes
        other_state = State.new code: 'XY', name: state1.name
        expect(other_state).to be_invalid
        expect(other_state.errors[:name]).not_to be_empty
      end
    end
  end

end
