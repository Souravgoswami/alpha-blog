class ArticleCategory < ApplicationRecord
	belongs_to :article
	belongs_to :category

	validate :check_duplicates

	private
	def check_duplicates
		errors[:base] << 'Record already exists!' if ArticleCategory.where(article_id: article_id, category_id: category_id).count > 0 && new_record?
	end
end
