class Place < ActiveRecord::Base
	has_many :meetings
	has_many :opinions
	attr_accessor :image
	mount_uploader :image, ImageUploader
	has_secure_password

	def place_registered? 
  		self.role == 'place_registered' 
	end

	def self.last_places_registered param
		places = Place.order(created_at: :desc).limit(param)
	end

end
