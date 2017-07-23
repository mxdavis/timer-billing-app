class Project < ApplicationRecord
  belongs_to :client
  has_many :tasks

  validates :client, presence: true
  validates :name, presence: true
end
