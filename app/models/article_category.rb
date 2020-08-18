class ArticleCategory < ApplicationRecord
	belongs_to :article
	belongs_to :category

	before_save :check_duplicates

	def check_duplicates
		if ArticleCategory.where(article_id: article_id, category_id: category_id).count > 0
			raise ActiveRecord::RecordExists, 'Record already exists' if new_record?
		end
	end
end
