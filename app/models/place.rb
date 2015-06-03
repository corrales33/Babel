class Place < ActiveRecord::Base
	has_many :meetings

	def self.last_places_registered param
		places = Place.order(created_at: :desc).limit(param)
	end

end
