class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
		
	end

	def new
		@user = User.new
	end

	def edit
		
	end

	def create
	    @user = User.new(user_params)
	    if @user.save
	      redirect_to users_path
	      session[:user_id] = @user.id.to_s
	    else
	      render :new
	    end
	end

	def update
		
	end

	def destroy
		
	end

private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
