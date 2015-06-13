class PlacesController < ApplicationController
	before_action :require_place, only: [:show, :edit]
	def show
		@place = Place.find params[:id]
	end

	def new
		@place = Place.new	
	end

	def create
		@place = Place.new places_params
		if @place.save
			redirect_to login_place_path
		elsif
			redirect_to '/signup'
		end
	end

	def edit
		@place = Place.find params[:id]
	end

	def update
		@place = Place.find params[:id]
		if @place.update places_params
			redirect_to @place
		else
			redirect_to place_path(@place)
		end
	end

	private

	def places_params
		params.require(:place).permit(:name, :password, :city, :average_place, :address, :offers, :opinions, :image)	
	end
end
