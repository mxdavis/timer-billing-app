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

  end
end
