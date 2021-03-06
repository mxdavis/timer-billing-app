class Task < ApplicationRecord
  belongs_to :project
  
  validates :project, presence: true
  validates :bill_time, presence: true
  before_validation :convert_bill_time_to_decimal
  before_save :calculate_total

  def convert_bill_time_to_decimal
    if bill_time =~ /^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$/ || bill_time =~ /^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/
      time_pieces = bill_time.split(":")
      hours = time_pieces[0].to_i
      minutes = (time_pieces[1].to_f/60.0)

      self.bill_time = (hours+minutes).round(1)
    end
  end

  def calculate_total
    total = bill_time.to_f * bill_rate
    self.total = total.round(2)
  end

  def self.newest
    order("DATE DESC")
  end
end
