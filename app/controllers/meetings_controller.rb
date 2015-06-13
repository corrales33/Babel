class MeetingsController < ApplicationController
	before_action :require_user, only: [:show]

	def index
		@user = User.find params[:user_id]
		@meetings = @user.meetings
	end

	def show
		@user = User.find params[:user_id]
		@meeting = @user.meetings.find params[:id]
		@meeting.participants[current_user.name] = current_user.nick
		if @meeting.save
			redirect_to root_path
		elsif	
			redirect_to new_user_meeting_path(@user)
		end
	end

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

	def edit
		@user = User.find params[:user_id]
		@meeting = @user.meetings.find params[:id]
	end

	def update
		@meeting = Meeting.find params[:id]

		if @meeting.update meeting_params
			flash[:notice] = "File save successfully"
			redirect_to user_meetings_path
		else
			flash[:alert] = "File has not been updated"
			redirect_to edit_user_meeting_path(@user)
		end
	end

	def add_video
		@user = User.find params[:user_id]
		@meeting = @user.meetings.find params[:id]
	end

	def destroy
		meeting = Meeting.find params[:id]
		meeting.destroy
		redirect_to user_meetings_path
	end

	private
	def meeting_params
		params.require(:meeting).permit(:city, :language, :date, :participants, :image, :video)
	end

end
