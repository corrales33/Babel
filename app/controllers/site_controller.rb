class SiteController < ApplicationController

	def welcome
		@users = User.last_users_registered(4)
		@places = Place.last_places_registered(4)
		@meetings = Meeting.last_meetings_done(5)
		@users_total = User.all
	end

	def signup
		@users = User.all
		@places = Place.all
	end

end
