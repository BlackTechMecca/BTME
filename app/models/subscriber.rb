class Subscriber < ActiveRecord::Base
	before_save {self.email = email.downcase}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, length: {maximum: 225}, 
			  format: {with: VALID_EMAIL_REGEX}, 
			  uniqueness: {case_sensitive: false}
			  
	validates :location, presence: true, length: {maximum: 50}
end
