class GiveAway < ApplicationRecord
	validates :owner_id, presence: true
	belongs_to :user, foreign_key: 'owner_id'

	has_many :participations
	
end
