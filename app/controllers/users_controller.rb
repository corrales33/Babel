class UsersController < ApplicationController
	before_action :require_user, only: [:show, :edit]

	def show
		@user = User.find params[:id]
		@ratings = @user.ratings
	end

	def new
		@user = User.new	
	end

	def create
		@user = User.new users_params
		if @user.save
			flash[:alert] = "User created successfully"
			redirect_to login_user_path
		elsif
			flash[:alert] = "User has not been created"
			redirect_to '/signup'
		end
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
		if @user.update users_params
			flash[:alert] = "User updated successfully"
			redirect_to @user
		else
			flash[:alert] = "User has not been updated"
			redirect_to user_path(@user)
		end
	end

	private

	def users_params
		params.require(:user).permit(:name, :nick, :email, :password, :average_user, :city, :age, :job, :languages_learnt, :languages_without_learning, :hobbies, :image)	
	end

end
