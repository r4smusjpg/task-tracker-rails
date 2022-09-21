class Project < ApplicationRecord
  # relations
  has_many :tasks, dependent: :delete_all
  
  has_and_belongs_to_many :user

  # validations
  validates :name, presence: true
end
