class UsersController < ApplicationController
	before_action :require_user, only: [:show, :edit]

	def show
		@user = User.find params[:id]
		@rating = @user.ratings
	end

	def new
		@user = User.new	
	end

	def create
		@user = User.new users_params
		if @user.save
			flash[:alert] = "¡Bienvenid@! Ya formas parte de la comunidad"
			redirect_to login_user_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
		if @user.update users_params
			flash[:alert] = "Tus datos han sido actualizados correctamente"
			redirect_to @user
		else
			render 'edit'
		end
	end

	private

	def users_params
		params.require(:user).permit(:name, :nick, :email, :password, :participants_in_rating, :average_user, :city, :age, :job, :languages_learnt, :languages_without_learning, :hobbies, :image)	
	end

end
