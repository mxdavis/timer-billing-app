require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validations' do

    it 'requires a name' do
      user = build(:user, name: nil)
      expect(user.valid?).to equal(false)
      expect(user.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'requires an email' do
      user = build(:user, email: nil)
      expect(user.valid?).to equal(false)
      expect(user.errors.full_messages).to eq(["Email can't be blank"])
    end

  end

  describe 'relationships' do
    
    it 'has many companies'

    it 'has many projects through companies'

  end

      
end
