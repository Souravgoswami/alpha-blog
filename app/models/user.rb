class User < ApplicationRecord
	has_many :articles
	before_save { self.email = email.tap(&:downcase!) }

	EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :username, presence: true,
		uniqueness: { case_sensitive: false },
		length: { minimum: 3, maximum: 50 }

	validates :email, presence: true,
		uniqueness: { case_sensitive: false },
		length: { maximum: 105 },
		format: { with: EMAIL_REGEXP }

	has_secure_password
end
