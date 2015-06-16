class RatingsController < ApplicationController
	def new
		@user = User.find params[:user_id]
		@rating = @user.ratings.new 
	end

	def create
		@user = User.find params[:user_id]
		@rating = @user.ratings.new rating_params
		if @rating.save
			flash[:alert] = "Rating created successfully"
			redirect_to user_path(@user)
		elsif	
			flash[:alert] = "Rating has not been created"
			redirect_to user_path(@user)
		end 	
	end
=begin
	def new_rating_place
		@place = Place.find params[:place_id]
		@rating = @place.ratings.new 
	end

	def create_rating_place
		@place = Place.find params[:place_id]
		@rating = @place.ratings.new rating_params
		if @rating.save
			flash[:notice] = "Rating created successfully"
			redirect_to place_path(@place)
		elsif	
			flash[:alert] = "Rating has not been created"
			redirect_to place_path(@place)
		end 	
	end
=end
	private
	def rating_params
		params.require(:rating).permit(:user, :score) #:place
	end
end
