class CommentsController < ApplicationController

	before_action :set_comment, only: [:show, :edit, :update, :destroy]

	def index
		@comments = Comment.all
	end

	def show
		@comments = Comment.find(params[:id])
	end

	def new
		if current_user
			@comment = Comment.new
			@pet = Pet.find(params[:pet_id])
			@post = Post.find(params[:post_id])
			@user = User.find(session[:user_id])
		else
			redirect_to root_path
		end
	end

	def edit
		
	end

	def create
		@user = User.find(session[:user_id])
		@pet = Pet.find(params[:pet_id])
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		@comment.user_id = @user.id
		@comment.save
		redirect_to pet_post_path(params[:pet_id],params[:post_id])
	end

	def update
		
	end

	def destroy
		@comment.destroy
		respond_to do |format|
	      	format.html { redirect_to pets_url, notice: 'comment successfully deleted.' }
	      	format.json { head :no_content }
	    end
	end

private

	def set_comment
		@comment = comment.find(params[:id])
	end

	def comment_params
	    params.require(:comment).permit(:body, :post_id, :user_id)
	end

end
