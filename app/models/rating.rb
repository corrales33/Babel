class Rating < ActiveRecord::Base
	validates :score, numericality: { only_integer: {message: 'La puntuación debe ser un valor numérico'} }
	belongs_to :user
end
