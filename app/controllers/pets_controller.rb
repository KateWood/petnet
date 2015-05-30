class PetsController < ApplicationController

	def index
		@pets = Pet.all
	end

	def new
		@pet = Pet.new
	end

	def create
		@user = User.find(session[:user_id])
    	@pet = @user.pets.create(pet_params)
    	redirect_to pets_path
	    # @pet = Pet.new(pet_params)
	    # if @pet.save
	    #   redirect_to pets_path
	    # else
	    #   render :new
	    # end
	end

private

	def pet_params
	    params.require(:pet).permit(:name, :birthday, :photo, :user_id)
	end

end
