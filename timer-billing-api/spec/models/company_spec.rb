require 'rails_helper'

RSpec.describe Company, type: :model do
  
    describe 'validations' do

    it 'requires a name' do
      company = build(:company, name: nil)
      expect(company.valid?).to equal(false)
      expect(company.errors.full_messages).to include("Name can't be blank")
    end

    it 'requires an email' do
      company = build(:company, email: nil)
      expect(company.valid?).to equal(false)
      expect(company.errors.full_messages).to include("Email is invalid")
    end

    it 'requires a valid email' do
      company1 = build(:company, email: 'firstname@a.')
      company2 = build(:company, email: 'firstname@company')
      company3 = build(:company, email: 'firstname.com')

      expect(company1.valid?).to equal(false)
      expect(company2.valid?).to equal(false)
      expect(company3.valid?).to equal(false)
      expect(company1.errors.full_messages).to include("Email is invalid")
    end
  end

  describe 'relationships' do
    
    it 'belongs to a user' do 
      company = create(:company)

      expect(company.user.name).to eq("Malki Davis")
    end

    it 'has many projects'

  end
end
