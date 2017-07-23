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
      expect(user.errors.full_messages).to eq(["Email can't be blank", "Email is invalid"])
    end

    it 'requires a valid email' do
      user1 = build(:user, email: 'firstname@a.')
      user2 = build(:user, email: 'firstname@company')
      user3 = build(:user, email: 'firstname.com')

      expect(user1.valid?).to equal(false)
      expect(user2.valid?).to equal(false)
      expect(user3.valid?).to equal(false)
      expect(user1.errors.full_messages).to eq(["Email is invalid"])
    end

  end

  describe 'relationships' do
    
    it 'has many clients' do
      user = create(:user)

      expect(user.clients).not_to eq(nil)
    end

    it 'has many projects through clients' do
      user = create(:user)

      expect(user.projects).not_to eq(nil)   
    end   
  end

      
end
