class Project < ApplicationRecord
  # relations
  has_many :tasks, dependent: :delete_all
  has_and_belongs_to_many :users
  has_many :activities, as: :target

  # validations
  validates :name, presence: true
end
