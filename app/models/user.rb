class User < ActiveRecord::Base
	has_many :meetings

	def self.last_users_registered param
		users = User.order(created_at: :desc).limit(param)
	end

end
