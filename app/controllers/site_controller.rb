class SiteController < ApplicationController

	def welcome
		@users = User.last_users_registered(4)
		@places = Place.last_places_registered(4)
	end

end
