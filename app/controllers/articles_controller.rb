class ArticlesController < ApplicationController
	def show
		@article = Article.find(params[:id])
	end
	def index
		@articles = Article.all
	end
	def edit
		@article = Article.find(params[:id])
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(params.require(:article).permit(:title, :description))
		if @article.save
			flash[:notice] = "Article was successfully saved!"
			redirect_to articles_path(@article)
		else
			# redirect_to new_article_path
			render 'new'
		end
	end
	def update
		@article = Article.find(params[:id])
		if @article.update(params.require(:article).permit(:title, :description))
			flash[:notice] = "Article was succesfully updated"
			redirect_to @article
		else
			render 'edit'
		end	
	end
end