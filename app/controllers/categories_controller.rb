class CategoriesController < ApplicationController
	before_action :require_admin, except: [:show, :index]
	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end
	def show
		@category = Category.find(params[:id])
		@articles = @category.articles.paginate(page: params[:page], per_page: 3)
	end
	def new
		@category = Category.new
	end
	def create
		@category = Category.new(category_param)
		if @category.save
			flash[:notice] = "Category was successfully created"
			redirect_to category_path(@category)
		else
			render 'new'
		end
	end
	def edit
		@category = Category.find(params[:id])
	end
	def update
		@category = Category.find(params[:id])
		if @category.update(category_param)
			flash[:notice] = "Category was successfully updated"
			redirect_to category_path(@category)
		else
			render 'edit'
		end
	end

private
	def category_param
		params.require(:category).permit(:name)
	end
	def require_admin
		if !(logged_in? && current_user.admin?)
			flash[:alert] = "only admin perform that action"
			redirect_to categories_path
		end
	end
end