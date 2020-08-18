class CategoriesController < ApplicationController
	include PaginationOf
	before_action :set_category, only: %i[ show edit update ]
	before_action :require_admin, except: %i[ index show ]

	def index
		@categories = paginate(Category)
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:notice] = 'Category was successfully created'
			redirect_to @category
		else
			render :new
		end
	end

	def show
		@articles = paginate(@category.articles)
	end

	def edit
	end

	def update
		if @category.update(category_params)
			flash[:notice] = 'Category name updated successfully'
			redirect_to @category
		else
			render :edit
		end
	end

	private
	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name)
	end

	def require_admin
		unless logged_in? && current_user.admin?
			flash[:notice] = 'Only admins perform that action'
			redirect_to categories_path
		end
	end
end
