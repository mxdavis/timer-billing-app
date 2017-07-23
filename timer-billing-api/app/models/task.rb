class Task < ApplicationRecord
  belongs_to :project

  validates :project_id, presence: true
  validates :bill_time, presence: true
end
