class User < ApplicationRecord
  belongs_to :role
  has_one :profile

  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 80 }, format: { with: ConstantData::VALID_EMAIL_REGEX }
  validates :password_digest, presence :true, length: { minimum: 6 }

end
