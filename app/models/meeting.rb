class Meeting < ActiveRecord::Base
	belongs_to :user
	belongs_to :place
	attr_accessor :image_meeting
	mount_uploader :image_meeting, ImageMeetingUploader
	serialize :participants, Array

	def self.last_meetings_done param
		meetings = Meeting.where('date < ?', Time.now+2.hours).limit(param)
	end

	def self.next_meetings param
		meetings = Meeting.where('date > ?', Time.now+2.hours).limit(param)
		next_meetings = meetings.order('date ASC')
	end

	def self.save_participants
		meetings = Meeting.where.not(part_confirm: nil).where('date > ?', Time.now+2.hours)
		meetings_confirm = meetings.order('date ASC')
	end

end
