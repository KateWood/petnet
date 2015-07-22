class SessionsController < ApplicationController

    def new
      @pets = Pet.all
  	end

  	def create
  		user = User.find_by(email: params[:login][:email])
	    if user && user.authenticate(params[:login][:password])
	      	session[:user_id] = user.id.to_s
          redirect_to pets_path
          flash[:notice] = "You have successfully logged in"
	    else
          render "new"
          flash.now[:info] = "You have successfully logged in"
	      	# @error = "Email and password do not match"
	    end
  	end

  	def destroy
  		session.delete(:user_id)
      redirect_to login_path
  	end

end
