class Article < ApplicationRecord
	validates :title, presence: true, length: { minimum: 6, maximium: 100 }
	validates :description, presence: true, length: { minimum: 10, maximum: 300 }
	before_save :set_author

	def set_author
		self.author = 'Sourav Goswami' if self.author &.empty?
	end
end
