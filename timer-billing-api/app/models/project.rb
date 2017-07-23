class Project < ApplicationRecord
  belongs_to :company
  has_many :tasks

  validates :name, presence: true
end
