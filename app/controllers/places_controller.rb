class PlacesController < ApplicationController
	before_action :require_place, only: [:edit]
	def show
		@place = Place.find params[:id]
	end

	def new
		@place = Place.new	
	end

	def create
		@place = Place.new places_params
		if @place.save
			flash[:alert] = "¡Bienvenid@! Ya formas parte de la comunidad"
			redirect_to login_place_path
		else
			redirect_to 'new'
		end
	end

	def edit
		@place = Place.find params[:id]
	end

	def update
		@place = Place.find params[:id]
		if @place.update places_params
			flash[:alert] = "Tus datos han sido actualizados correctamente"
			redirect_to @place
		else
			render 'edit'
		end
	end

	def change_offer
		@place = Place.find params[:place_id]
	end

	private

	def places_params
		params.require(:place).permit(:name, :password, :city, :average_place, :address, :offers, :opinions, :timetable, :image_place, :image_offer)	
	end
end
