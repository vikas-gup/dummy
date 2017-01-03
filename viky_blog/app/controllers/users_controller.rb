class UsersController < ApplicationController
	def index
		users = User.all
		render :json => users, :status => :ok
	end

	def show
		@user = User.find(params[:id])
		render :json => @user, :status => :ok
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			render :json => @user, :status => :ok
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end

	def looged_in_user
		if current_user
			render json: current_user, status: :ok
		else
			render json: {:message => 'Nobody logged In'}, status: :ok
		end
	end

	private
	def user_params
		params[:user].permit(:firstname, :lastname, :email, :contact_number, :username)
	end
end
