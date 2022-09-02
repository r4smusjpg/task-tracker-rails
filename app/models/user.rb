class User < ApplicationRecord
  # relations
  has_secure_password

  has_many :projets

  # validations
  validates :email, presence: true, uniqueness: true
end
