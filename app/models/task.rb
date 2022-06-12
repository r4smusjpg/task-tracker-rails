class Task < ApplicationRecord
  belongs_to :project

  # validations
  validates :title, presence: true, length: { minimum: 5 }
  validates :project_id, presence: true
end
