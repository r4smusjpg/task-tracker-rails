class Project < ApplicationRecord
  has_many :tasks

  # validations
  validates :name, presence: true
end
