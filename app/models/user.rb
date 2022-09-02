class User < ApplicationRecord
  # relations
  has_secure_password

  has_and_belongs_to_many :projects

  # validations
  validates :email, presence: true, uniqueness: true
end
