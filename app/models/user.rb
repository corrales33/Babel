class User < ActiveRecord::Base
	has_many :meetings
	has_many :ratings
	has_many :opinions
	validates :name, presence: {message: 'El campo nombre debe completarse'}
	validates :nick, presence: {message: 'El campo nick debe completarse'}
	validates :nick, uniqueness: {message: 'Este nick ya existe en la base de datos'}
	validates :email, uniqueness: {message: 'Este email ya está registrado en la base de datos'}
	attr_accessor :image
	mount_uploader :image, ImageUploader
	has_secure_password
	serialize :participants_in_rating, Array

	def user_registered? 
  		self.role == 'user_registered' 
	end

	def self.last_users_registered param
		users = User.order(created_at: :desc).limit(param)
	end

	def calculate_average 
		array_ratings = []
		if self.ratings.any?
			self.ratings.each do |rating| 
			array_ratings << rating.score
			end
			total_scores = array_ratings.reduce(:+)
			self.average_user = (total_scores.to_f/array_ratings.length.to_f).round(1)
			self.save
		else
			'No rated yet'
		end
	end

end
