require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) do
    {
      full_name: 'John Smith',
      email: '123@email.com'
    }
  end

  let(:user) { User.new valid_attributes }

  it 'is valid if all attributes are correct' do
    expect(user).to be_valid
  end

  describe '#full_name' do
    context 'is invalid if' do
      it 'is empty' do
        user.full_name = nil
        expect(user).to be_invalid
        expect(user.errors[:full_name]).not_to be_empty
      end

      it 'is shorter than 2 characters' do
        user.full_name = 'A'
        expect(user).to be_invalid
        expect(user.errors[:full_name]).not_to be_empty
      end
    end
  end

  describe '#email' do
    context 'is invalid if' do
      it 'is empty' do
        user.email = nil
        expect(user).to be_invalid
        expect(user.errors[:email]).not_to be_empty
      end

      it 'is an invalid email' do
        user.email = 'simplestring'
        expect(user).to be_invalid
        expect(user.errors[:email]).not_to be_empty

        user.email = '@missingusername.com'
        expect(user).to be_invalid
        expect(user.errors[:email]).not_to be_empty

        user.email = 'missingdomain@.com'
        expect(user).to be_invalid
        expect(user.errors[:email]).not_to be_empty

        user.email = 'missingafterat@'
        expect(user).to be_invalid
        expect(user.errors[:email]).not_to be_empty

        user.email = '123@tofinaldot.'
        expect(user).to be_invalid
        expect(user.errors[:email]).not_to be_empty
      end
    end
  end
end
