class MeetingsController < ApplicationController

	def index
		if current_user 
			@places_total = Place.all
			@user = User.find params[:user_id]
			@meetings = @user.meetings
			@own_meetings_done = @meetings.last_meetings_done(10)
			@own_next_meetings = @meetings.next_meetings(10)
			@meetings_confirm = Meeting.save_participants
		elsif current_place
			@places_total = Place.all
			@users_total = User.all
			@place = Place.find params[:place_id]
			@meetings_in_my_place = @place.meetings
			@next_meetings_own_place = @meetings_in_my_place.next_meetings(15)
			@meetings_own_place_done = @meetings_in_my_place.last_meetings_done(15)
		end	
	end

	def assist_meeting
		@user = User.find params[:user_id]
		@meeting = Meeting.find params[:id]
		user_exist = @meeting.participants.select{|user| user.id == current_user.id}
		if user_exist.blank?
			@meeting.participants.push(current_user)
			@meeting.save	
			flash[:alert] = 'Apuntado con éxito'
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
		@places_total = Place.all
		@user = User.find params[:user_id]
		@meeting = @user.meetings.new
	end

	def create
		@user = User.find params[:user_id]
		@meeting = @user.meetings.new meeting_params
		if @meeting.save && (@meeting.place_id != nil)
			flash[:alert] = "La reunión ha sido creada con éxito :)"
			redirect_to root_path
		else	
			flash[:alert] = "Debes elegir un establecimiento para organizar tu reunión"
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
			redirect_to edit_user_meeting_path(@meeting)
		end
	end

	def destroy
		meeting = Meeting.find params[:id]
		meeting.destroy
		redirect_to user_meetings_path
	end

	def update_parameter
		@meeting = Meeting.find params[:id]
		@meeting.part_confirm = params[:meeting][:part_confirm]
		if @meeting.save && @meeting.part_confirm != ""
			flash[:alert] = 'Confirmado'
			redirect_to root_path
		else
			flash[:alert] = "Debes escoger a uno de tus participantes"
			redirect_to user_meeting_path(current_user, @meeting)
		end
	end

	def add_photo
		@user = User.find params[:user_id]
		@meeting = Meeting.find params[:id]
		if @meeting.update meeting_params
			flash[:alert] = 'Foto añadida'
			redirect_to user_meetings_path(@user)
		end
	end

	private
	def meeting_params
		params.require(:meeting).permit(:city, :place_meeting, :place_id, :language, :date, :participants, :part_confirm, :image_meeting )
	end

end
