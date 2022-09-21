class Task < ApplicationRecord
  # relations
  belongs_to :project
  has_many :comments

  # validations
  validates :title, presence: true, length: { minimum: 5 }
  validates :project_id, presence: true
end
