class Meeting < ActiveRecord::Base
	belongs_to :user

	def self.last_meetings_done param
		meetings = Meeting.order(created_at: :desc).limit(param)
	end
end
