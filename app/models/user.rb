class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  before_save { self.email = email.downcase }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end