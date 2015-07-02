class Place < ActiveRecord::Base
	has_many :meetings
	has_many :opinions
	validates :name, presence: true
	validates :name, uniqueness: true
	attr_accessor :image_place, :image_offer
	mount_uploader :image_place, ImagePlaceUploader
	mount_uploader :image_offer, ImageOfferUploader
	has_secure_password

	def place_registered? 
  		self.role == 'place_registered' 
	end

	def self.last_places_registered param
		places = Place.order(created_at: :desc).limit(param)
	end

end
