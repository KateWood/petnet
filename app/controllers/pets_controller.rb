class PetsController < ApplicationController

	before_action :set_pet, only: [:show, :edit, :update, :destroy]

	def index
		@pets = Pet.all
		# makes the modal work for adding a new pet
		@pet = Pet.new
	end

	def show
		@pet = Pet.find(params[:id])
		@posts = Post.where(pet_id: @pet.id)
	end

	def new
		@pet = Pet.new
	end

	def create
		@user = User.find(session[:user_id])
    	@pet = @user.pets.create(pet_params)
	    @pet = Pet.new(pet_params)
	    # raise @pet.inspect
	    redirect_to pets_path
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

	def destroy
		@pet.destroy
	    respond_to do |format|
	      	format.html { redirect_to pets_url, notice: 'Pet profile successfully deleted.' }
	      	format.json { head :no_content }
	    end
	end

private

	def set_pet
		@pet = Pet.find(params[:id])
	end

	def pet_params
	    params.require(:pet).permit(:name, :birthday, :photo, :description, :user_id, :image)
	end

end
