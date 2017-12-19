class Participation < ApplicationRecord
	belongs_to :exchange
	belongs_to :user
	belongs_to :giftee, class_name: "User", optional: true
	
end
