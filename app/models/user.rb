class User < ActiveRecord::Base
	has_many :meetings
	validates :name, uniqueness: true
	validates :name, presence: true
	attr_accessor :image
	mount_uploader :image, ImageUploader
	has_secure_password

	def user_registered? 
  		self.role == 'user_registered' 
	end

	def self.last_users_registered param
		users = User.order(created_at: :desc).limit(param)
	end

end
