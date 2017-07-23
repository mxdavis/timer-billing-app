require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it 'requires a name' do
      project = build(:project, name: nil)
      expect(project.valid?).to equal(false)
      expect(project.errors.full_messages).to include("Name can't be blank")
    end

    it 'requires a client' do
      project = build(:project, client: nil)
      expect(project.valid?).to equal(false)
      expect(project.errors.full_messages).to include("Client can't be blank")
    end
  end
  describe 'relationships' do
    
    it 'belongs to a client' do 
      project = create(:project)

      expect(project.client.name).to eq("Apple Co.")
    end

    it 'has many tasks' do
      project = create(:project)

      expect(project.tasks).not_to eq(nil)
    end

  end
end
