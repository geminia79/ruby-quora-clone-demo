class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	validates :password, presence: true, length: { in: 6..20 }

	def self.authenticate(user_params)
		User.find_by(user_params) || nil
	end
end
