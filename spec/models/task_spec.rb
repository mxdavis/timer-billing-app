require 'rails_helper'
  
RSpec.describe Task, type: :model do
   
   describe 'validations' do

    it 'converts hours to decimal before save' do
      task = build(:task, bill_time: '1:30:00')
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

  describe 'total' do
    
    it 'task should automatically calculate total upon save' do
      task = create(:task)
      total = task.bill_time.to_f * task.bill_rate
      expect(task.total).to eq(total)
    end

    it 'task should replace with new total if updated' do
      task = create(:task)
      task.bill_time = 1
      task.bill_rate = 150
      task.save
      expect(task.total).to eq(150)
    end
  end

  describe 'billed time' do
    it 'accepts decimal and saves' do
      task = build(:task, bill_time: 1.5)
      task.save

      expect(task.bill_time).to eq("1.5")
    end

    it 'accepts decimal and updates after it was already saved' do
      task = create(:task, bill_time: 1.5)
      task.bill_time = "2:30:00"
      task.save

      expect(task.bill_time).to eq("2.5")
    end
  end

  describe 'newest' do
    it 'shows the tasks in order from newest to oldest' do
      task1 = create(:task, date: "2001-01-01")
      task2 = create(:task, date: "2002-02-02")
      all_tasks_from_newest_to_oldest = Task.newest
      expect(all_tasks_from_newest_to_oldest.first).to eq(task2)
    end
  end
end
