class RatingsController < ApplicationController
	def new
		@user = User.find params[:user_id]
		@rating = @user.ratings.new 
	end

	def create
		@user = User.find params[:user_id]
		@rating = @user.ratings.new rating_params
		if @rating.save
			@user.participants_in_rating.push(current_user.id)
			@user.save
			flash[:alert] = "Rating created successfully"
			redirect_to user_path(@user)
		else	
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
=begin	
	def save_participant
		@user = User.find params[:user_id]
		@rating = Rating.find params[:id]
		user_exist = @rating.participants_in_rating.select{|user| user.id == current_user.id}
		binding.pry
		if user_exist.blank?
			@rating.participants_in_rating.push(current_user)
			binding.pry
			@rating.save	
			flash[:alert] = 'User votado successfully'
		end
		
	end
=end
	private
	def rating_params
		params.require(:rating).permit(:user, :user_id, :score, :participants_in_rating) #:place
	end
end
