class Rating < ActiveRecord::Base
	validates :score, numericality: { only_integer: true }
	belongs_to :user
end
