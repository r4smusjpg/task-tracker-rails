class Activity < ApplicationRecord
  ALLOWED_KINDS = ['project_created']

  # relations
  belongs_to :user
  belongs_to :target, polymorphic: true

  # validations
  validates :user_id, presence: true
  validates :kind, inclusion: { in: ALLOWED_KINDS }
end
