class GiveAway < ApplicationRecord
<<<<<<< HEAD
	has_and_belongs_to_many :users
	belongs_to :owner, class_name: 'User'
=======
	belongs_to :owner, class_name: 'User'
	validates :owner_id, presence: true
	belongs_to :user, foreign_key: 'owner_id'

	has_many :participations
>>>>>>> parent of 7eb36ba... give away functionality
end
