class Project < ApplicationRecord
  has_many :tasks, dependent: :delete_all

  # validations
  validates :name, presence: true
end
