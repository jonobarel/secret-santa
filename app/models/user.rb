class User < ApplicationRecord
	before_save {self.email = email.downcase }
	has_and_belongs_to_many :give_aways
	validates :name, presence: true, length: {maximum: 80}
	validates :email, presnce: true, length: {maximum: 250},
						uniqueness: {case_sensitive: false}

	validates :password, length: {minimum: 8}
	has_secure_password
end
