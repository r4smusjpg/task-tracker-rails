class Comment < ApplicationRecord
  # relations
  belongs_to :user
  belongs_to :task

  # validations
  validates :content, presence: true, length: { minimum: 5 }
end
