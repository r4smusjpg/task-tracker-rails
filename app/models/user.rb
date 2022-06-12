class User < ApplicationRecord
  has_secure_password

  has_many :projects

  # validations
  validates :email, presence: true, uniqueness: true
end
