class ArticlesController < ApplicationController
	include PaginationOf
	before_action :set_article, only: %i[ show edit update destroy ]
	before_action :require_user, except: %i[ show index ]
	before_action :require_same_user, only: %i[ edit update destroy]

	def index
		@articles = paginate(Article)
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user = current_user

		if @article.save
			redirect_to @article
			flash[:notice] = 'Article was created successfully created'
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @article.update(article_params)
			flash[:notice] = "Article #{@article.id} was updated successfully"
			redirect_to article_path(@article)
		else
			render :edit
		end
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end

	private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description, category_ids: [])
	end

	def require_same_user
		if current_user != @article.user && !current_user.admin?
			flash[:alert] = "Sorry, the address wasn't understood"
			redirect_to @user
		end
	end
end
