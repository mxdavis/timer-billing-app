class Company < ApplicationRecord
  belongs_to :user
  has_many :projects
  has_many :tasks, through: :projects

  validates :name, presence: true
end
