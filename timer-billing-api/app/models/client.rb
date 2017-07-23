class Client < ApplicationRecord
  belongs_to :user
  has_many :projects
  has_many :tasks, through: :projects

  validates :name, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
