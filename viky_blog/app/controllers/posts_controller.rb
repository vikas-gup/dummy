class PostsController < ApplicationController
	def index
		@post = Post.all
		if params[:complete].present?
			@post = @post.where(completed: params[:complete])
		end
		render :json => @post, :status => :ok
	end

	def show
		@post = Post.find(params[:id])
		render :json => @post, :status => :ok
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			render json: @post, status: :created
		else
			render json: @post.errors, status: :unprocessable_entity
		end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			render json: @post, status: :ok
		else
			render json: @post.errors, status: :unprocessable_entity
		end
	end

	private
	def post_params
		params[:post].permit(:title, :description, :completed)
	end
end
