class User < ApplicationRecord
	before_save {self.email = email.downcase }
	#has_and_belongs_to_many :exchanges

	has_many :exchanges, foreign_key: 'owner_id'
	has_many :participations
	has_many :participating_exchanges, class_name: 'Exchange', through: :participations
	has_many :giftees, through: :participations



	validates :name, presence: true, length: {maximum: 80}
	validates :email, presence: true, length: {maximum: 250},
						uniqueness: {case_sensitive: false}

	has_secure_password

	validates :password, presence: true, length: {minimum: 6}
end
