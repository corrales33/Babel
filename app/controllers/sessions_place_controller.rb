class SessionsPlaceController < ApplicationController
	def new
		
	end

	def create
        @place = Place.find_by_name(params[:session][:name])
        if @place && @place.authenticate(params[:session][:password])
          session[:place_id] = @place.id
          redirect_to place_path(@place)
        else
          redirect_to '/login_place'
        end 
	end

	def destroy  
	    session[:place_id] = nil 
	    redirect_to '/'
	end
	
end
