class User < ApplicationRecord
  # relations
  has_secure_password

  has_and_belongs_to_many :projects

  # validations
  validates :email, presence: true, uniqueness: true

  # methods
  def to_s
    self.full_name.blank? ? self.email : self.full_name
  end
end
