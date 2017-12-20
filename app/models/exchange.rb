class Exchange < ApplicationRecord
	validates :owner, presence: true
	belongs_to :owner, class_name: "User"

	has_many :participations
	has_many :users, through: :participations


end
