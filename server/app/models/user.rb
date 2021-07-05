class User < ApplicationRecord
	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	PASSWORD_REGEX = ^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,8}$

	validates :name, :presence => true, :length => { :maximum => 25 }
	validates :email, :presence => true, :length => { :maximum => 100 }, 
						:format => EMAIL_REGEX,
					  :confirmation => true
	validates :password, :presence => true, :length => { :minimum => 6 , :maximum => 8 },
							:format => PASSWORD_REGEX,
							:confirmation => true
end
