class SiteController < ApplicationController

	def welcome
		@users = User.last_users_registered(4)
		@places = Place.last_places_registered(4)
		@meetings = Meeting.last_meetings_done(5)
		#@user = User.find params[:user_id]
		#@meeting = @user.meetings
	end

end
