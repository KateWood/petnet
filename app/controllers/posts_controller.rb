class PostsController < ApplicationController

	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def show
		@pet = Pet.find(params[:pet_id])
		@posts = Post.find(params[:id])
		@comments = Comment.where(post_id: @post.id)
	end

	def new
		@post = Post.new
		@user = User.find(session[:user_id])
		@pet = Pet.find(params[:pet_id])
		@pets = Pet.where(user_id: @user.id)
	end

	def edit
		
	end

	def create
		@user = User.find(session[:user_id])
		@pet = Pet.find(params[:pet_id])
		@pets = Pet.where(user_id: @user.id)
		@post = Post.new(post_params)
		@post.save
		redirect_to pet_posts_path
	end

	def update
		
	end

	def destroy
		@post.destroy
		respond_to do |format|
	      	format.html { redirect_to pets_url, notice: 'Post successfully deleted.' }
	      	format.json { head :no_content }
	    end
	end

private

	def set_post
		@pet = Pet.find(params[:pet_id])
		@post = Post.find(params[:id])
	end

	def post_params
	    params.require(:post).permit(:title, :body, :image, :pet_id)
	end

end
