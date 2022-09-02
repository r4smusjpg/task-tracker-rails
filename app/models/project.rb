class Project < ApplicationRecord
  # relations
  has_many :tasks, dependent: :delete_all
  
  belongs_to :user

  # validations
  validates :name, presence: true
end
