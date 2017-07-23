require 'rails_helper'

RSpec.describe Client, type: :model do
  
    describe 'validations' do

    it 'requires a name' do
      client = build(:client, name: nil)
      expect(client.valid?).to equal(false)
      expect(client.errors.full_messages).to include("Name can't be blank")
    end

    it 'requires an email' do
      client = build(:client, email: nil)
      expect(client.valid?).to equal(false)
      expect(client.errors.full_messages).to include("Email is invalid")
    end

    it 'requires a valid email' do
      client1 = build(:client, email: 'firstname@a.')
      client2 = build(:client, email: 'firstname@client')
      client3 = build(:client, email: 'firstname.com')

      expect(client1.valid?).to equal(false)
      expect(client2.valid?).to equal(false)
      expect(client3.valid?).to equal(false)
      expect(client1.errors.full_messages).to include("Email is invalid")
    end
  end

  describe 'relationships' do
    
    it 'belongs to a user' do 
      client = create(:client)

      expect(client.user.name).to eq("Malki Davis")
    end

    it 'has many projects'

  end
end
