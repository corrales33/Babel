class Meeting < ActiveRecord::Base
	belongs_to :user
	belongs_to :place
	attr_accessor :image, :video
	mount_uploader :image, ImageUploader
	mount_uploader :video, VideoUploader
	serialize :participants, Array

	def self.last_meetings_done param
		meetings = Meeting.where('date < ?', Date.today).limit(param)
	end

	def self.next_meetings param
		meetings = Meeting.where('date > ?', Date.today).limit(param)
	end

end
