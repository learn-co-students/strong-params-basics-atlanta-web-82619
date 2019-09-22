class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  #@post = Post.new(params["post"]) #we get rid of this so we can specify which parameters are allowed
	  @post = Post.new(post_params(:title, :description)) #specifies which parameters are allowed
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id]) 
	  @post.update(post_params(:title)) #specifies which parameters are allowed to be edited
	  #@post.update(params["post"]) #we get rid of this so we can specify which parameters are allowed
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	def post_params(*args)
		params.require(:post).permit(*args)
	end
end
