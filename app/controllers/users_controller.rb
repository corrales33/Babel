class UsersController < ApplicationController
	before_action :require_user, only: [:index, :show, :edit]
	#before_action :require_user_registered, only: [:edit]

	def show
		@user = User.find params[:id]
	end

	def new
		@user = User.new	
	end

	def create
		@user = User.new users_params
		if @user.save
			redirect_to user_path(@user)
		elsif
			redirect_to '/signup'
		end
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
		if @user.update users_params
			redirect_to @user
		else
			redirect_to user_path(@user)
		end
	end

	private

	def users_params
		params.require(:user).permit(:name, :nick, :email, :password, :rating, :city, :age, :job, :languages_learnt, :languages_without_learning, :hobbies, :image)	
	end

end
