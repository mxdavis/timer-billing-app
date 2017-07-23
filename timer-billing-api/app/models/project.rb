class Project < ApplicationRecord
  belongs_to :client
  has_many :tasks

  validates :name, presence: true
end
