class MeetingsController < ApplicationController
	def new
		@user = User.find params[:user_id]
		@meeting = @user.meetings.new
	end

	def create
		@user = User.find params[:user_id]
		@meeting = @user.meetings.new meeting_params
		if @meeting.save
			flash[:notice] = "Meeting created successfully"
			redirect_to root_path
		elsif	
			flash[:alert] = "Meeting has not been created"
			redirect_to new_user_meeting_path(@user)
		end
	end

	private
	def meeting_params
		params.require(:meeting).permit(:city, :address, :language, :date, :participant)
	end

end
