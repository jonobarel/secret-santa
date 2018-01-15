class Exchange < ApplicationRecord
	validates :owner, presence: true
	belongs_to :owner, class_name: "User"

	has_many :participations
	has_many :users, through: :participations
	has_many :giftees, through: :participations, class_name: "User"

	def assign
		unless participations.count < 3 
			self.locked = true
			participations = self.participations.order(:user_id)
			users_arr = self.users.ids.shuffle
			k = users_arr.count
			users_dict = {}
			(0...users_arr.count).each do |i|
				users_dict[users_arr[i]] = users_arr[(i+1)%k]
			end
			
			participations.each do |part|
				part.update(giftee_id: users_dict[part.user_id])
			end
		end

		self.locked
	end

	def locked?
		locked
	end
end
