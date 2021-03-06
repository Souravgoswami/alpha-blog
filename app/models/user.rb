class User < ApplicationRecord
	has_many :articles, dependent: :destroy
	before_save do
		email.downcase!
		username.replace(username.split(?\s).each(&:capitalize!).join(?\s))
	end

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
