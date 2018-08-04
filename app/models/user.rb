class User < ApplicationRecord
	attr_accessor :remember_token

	before_save {self.email = email.downcase }
	#has_and_belongs_to_many :exchanges

	has_many :exchanges, foreign_key: 'owner_id'
	has_many :participations
	has_many :participating_exchanges, class_name: 'Exchange', through: :participations, source: :exchange
	has_many :giftees, through: :participations
	#has_many :gifts, class_name: :participations, foreign_key: 'giftee_id', through: :participations, source: :participation
	has_many :gifts, class_name: 'Participation', foreign_key: 'giftee_id'

	#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	#validates :email, presence: true, length: { maximum: 255 },
    #                format: { with: VALID_EMAIL_REGEX },
    #                uniqueness: { case_sensitive: false }

	validates :name, presence: true, length: {maximum: 80}
	validates :email, presence: true, length: {maximum: 250},
						uniqueness: {case_sensitive: false}

	has_secure_password

	validates :password, presence: true, length: {minimum: 6}

	def participating? (ex)
		self.participating_exchanges.include?(ex)
	end

	def join (ex, secret_name = nil)
		unless participating? (ex)
			part = self.participations.build(exchange: ex, secret_name: secret_name)
			part.save
		else self.errors.add(:participating_exchanges, "already includes exchange #{ex.id}: #{ex.name}")
		end
	end

	def leave(ex)
		if participating?(ex)
			part = self.participations.find_by(exchange: ex)
			unless part.nil?
				#TODO - add support for dropping out after deadline but before assigning gifts
				part.destroy
			else
				#TODO turn this into an error log
				self.errors.add(:ex, "could not leave Exchange id: #{ex.id} - #{ex.name}, user not a participant")
			end
		end
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end


	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def User.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
  	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	def find_gifts
		gifts =  Participation.find_by(giftee: self, where: {})
	end
end
