require 'rails_helper'
require 'pry'
   
RSpec.describe Task, type: :model do
   
   describe 'validations' do

    it 'converts hours to decimal before save' do
      task = build(:task, bill_time: '1:30:00')
      task.save

      expect(task.bill_time).to eq("1.5")
    end

    it 'accepts decimal and saves' do
      task = build(:task, bill_time: 1.5)
      task.save

      expect(task.bill_time).to eq("1.5")
    end

    it 'requires a project' do
      task = build(:task, project: nil)
      expect(task.valid?).to equal(false)
      expect(task.errors.full_messages).to include("Project can't be blank")
    end
  end

  describe 'relationships' do
    
    it 'belongs to a project' do 
      task = create(:task)

      expect(task.project.name).to eq("Software Dev")
    end
  end
end
