class SiteController < ApplicationController

	def welcome
		@users = User.last_users_registered(4)
		@places = Place.last_places_registered(4)
		@meetings_done = Meeting.last_meetings_done(5)
		@next_meetings = Meeting.next_meetings(5)
		@users_total = User.all
		@places_total = Place.all
	end

	def signup
		@users = User.all
		@places = Place.all
	end

end
