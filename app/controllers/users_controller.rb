class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
		@pets = Pet.where(user_id: @user.id)
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
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to @user, notice: "Your profile was successfully updated." }
				format.json { render :show, status: :ok, location: @user }
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		
	end

private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
	end

end
