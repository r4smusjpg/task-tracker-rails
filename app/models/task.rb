class Task < ApplicationRecord
  ALLOWED_STATUSES = ["not_started", "started", "finished"]

  # relations
  belongs_to :project
  has_many :comments

  # validations
  validates :title, presence: true, length: { minimum: 5 }
  validates :project_id, presence: true
  validates :status, inclusion: { in: ALLOWED_STATUSES }
end
