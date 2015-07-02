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
			flash[:alert] = "Tu opinión ha sido registrada. ¡Gracias!"
			redirect_to place_opinions_path(@place)
		end
	end

	private
	def opinion_params
		params.require(:opinion).permit(:comment, :user_id, :place_id)
	end
end
