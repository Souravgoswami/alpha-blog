module PaginationOf
	extend ActiveSupport::Concern

	def paginate(x)
		x.paginate(page: params[:page], per_page: (params[:items] || 8).to_i.clamp(1, 5000))
	end
end
