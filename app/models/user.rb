class User < ApplicationRecord
	before_save {self.email = email.downcase }
<<<<<<< HEAD
	#has_and_belongs_to_many :exchanges

	has_many :exchanges, foreign_key: 'owner_id'
	has_many :participations

=======
	has_and_belongs_to_many :give_aways
>>>>>>> parent of 74a52d0... Give Aways
	validates :name, presence: true, length: {maximum: 80}
	validates :email, presence: true, length: {maximum: 250},
						uniqueness: {case_sensitive: false}

	
	has_secure_password
	validates :password, presence: true, length: {minimum: 6}
end
