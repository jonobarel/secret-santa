class Participation < ApplicationRecord
	belongs_to :exchange
	belongs_to :user
	belongs_to :giftee, class_name: "User", optional: true
	has_one :part_as_giftee, class_name: "Participation", primary_key: 'user_id', foreign_key: 'giftee_id'

	def get_giftee_secret_name
		#TODO fix this method to actually get the secret name
		unless giftee.nil?
			giftee.name
		else
			nil
		end
	end
end
