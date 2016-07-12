class BlogsController < ApplicationController
	before_action :authenticate_user!

	def index
		@blogs = Blog.all
	end

	def show
		find_blog
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.create(blog_params.merge(user: current_user))
	end

	def edit
		find_blog
	end

	def update
		find_blog
		@blog.update(blog_params)
	end

	def destroy
		find_blog
		@blog.destroy
	end


private

	def find_blog 
		@blog = Blog.find(params[:id])
	end

	def blog_params
		params[:blog].permit(:text)
	end

end
