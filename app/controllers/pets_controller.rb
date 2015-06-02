class PetsController < ApplicationController

	def index
		@pets = Pet.all
	end

	def show
		@pet = Pet.find(params[:id])
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

	def edit
		@pet = Pet.find(params[:id])
	end

	def update
		@pet = Pet.find(params[:id])
		respond_to do |format|
			if @pet.update(pet_params)
				format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        		format.json { render :show, status: :ok, location: @pet }
        	else
        		format.html { render :edit }
        		format.json { render json: @pet.errors, status: :unprocessable_entity }
      		end
      	end
	end

private

	def pet_params
	    params.require(:pet).permit(:name, :birthday, :photo, :description, :user_id, :image)
	end

end
