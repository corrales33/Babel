class SiteController < ApplicationController

	def welcome
		@users = User.last_users_registered(10)
		@places = Place.last_places_registered(5)
		@meetings_done = Meeting.last_meetings_done(10)
		@next_meetings = Meeting.next_meetings(15)
		@meetings_confirm = Meeting.save_participants
		@users_total = User.all
		@places_total = Place.all
		@places_with_offer = Place.get_offer
	end

	def signup
		@users = User.all
		@places = Place.all
	end
	
end
