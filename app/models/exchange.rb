class Exchange < ApplicationRecord
	validates :owner_id, presence: true
	belongs_to :owner, class_name: "user"

	has_many :participations
	
end
