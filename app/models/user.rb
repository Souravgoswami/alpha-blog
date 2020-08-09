class User < ApplicationRecord
	has_many :articles
	EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :username, presence: true,
		uniqueness: { case_sensitive: false },
		length: { minimum: 3, maximum: 50 }

	validates :email, presence: true,
		uniqueness: { case_sensitive: false },
		length: { maximum: 105 },
		format: { with: EMAIL_REGEXP }
end
