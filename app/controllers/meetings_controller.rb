class MeetingsController < ApplicationController
	before_action :require_user, only: [:show]

	def index
		@places_total = Place.all
		@user = User.find params[:user_id]
		@meetings = @user.meetings
		@own_meetings_done = @meetings.last_meetings_done(10)
		@own_next_meetings = @meetings.next_meetings(10)
	end

	def assist_meeting
		@user = User.find params[:user_id]
		@meeting = Meeting.find params[:id]
		user_exist = @meeting.participants.select{|user| user.id == current_user.id}
		if user_exist.blank?
			@meeting.participants.push(current_user)
			@meeting.save	
			flash[:alert] = 'Apuntado succesfully'
			redirect_to root_path
		else
			flash[:alert] = 'Ya estás apuntado a la oferta'
			redirect_to root_path
		end
	end

	def show
		@places_total = Place.all
		@user = User.find params[:user_id]
		@meeting = @user.meetings.find params[:id]
	end

	def new
		@user = User.find params[:user_id]
		@meeting = @user.meetings.new
	end

	def create
		@user = User.find params[:user_id]
		@meeting = @user.meetings.new meeting_params
		if @meeting.save
			flash[:alert] = "Meeting created successfully"
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
			flash[:alert] = "File save successfully"
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

	def update_parameter
		@meeting = Meeting.find params[:id]
		@meeting.part_confirm = params[:meeting][:part_confirm]
		@meeting.save
		flash[:alert] = 'Confirmado'
		redirect_to root_path
	end

	private
	def meeting_params
		params.require(:meeting).permit(:city, :place_meeting, :place_id, :language, :date, :participants, :part_confirm, :image, :video)
	end

end
