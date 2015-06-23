class OpinionsController < ApplicationController

	def index
		@users_total = User.all
		@place = Place.find params[:place_id]
		@opinions = Opinion.all
	end

	def new
		@place = Place.find params[:place_id]
		@opinion = @place.opinions.new
	end

	def create
		@place = Place.find params[:place_id]
		@opinion = @place.opinions.new opinion_params
		if @opinion.save
			flash[:alert] = "Opinion created successfully"
			redirect_to place_opinions_path(@place)
		elsif	
			flash[:alert] = "Opinion has not been created"
			redirect_to new_place_opinion_path(@place)
		end
	end

	private
	def opinion_params
		params.require(:opinion).permit(:comment, :user_id, :place_id)
	end
end
