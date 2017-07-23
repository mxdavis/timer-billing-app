class User < ApplicationRecord
  has_many :companies
  has_many :projects, through: :companies

  validates :name, presence: true
  validates :email, presence: true
end
