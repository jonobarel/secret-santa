class Exchange < ApplicationRecord
	validates :owner, presence: true
	belongs_to :owner, class_name: "User"

	has_many :participations
	has_many :users, through: :participations
	has_many :giftees, through: :participations, class_name: "User"

	#Assign - locks the Exchange from additional participants joining, and assigns the participating members to one another


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

	#Locked - means no one can join the Exchange, and gifters have been assigned.
	def locked?
		locked
	end

	#close - sets the exchange status to "closed", meaning that no additional changes are possible. At this point, the gifts become visible to the receivers to be redeemed.
	def close
		if (self.locked?)
			self.closed = true
			self.close_date = Date.today
		end
		#TODO - before closing, identify and flag users who have failed to input a gift - warn the owner
		self.closed		
	end

	def closed?
		return self.closed == true
	end
end
