class User < ApplicationRecord
  	has_many :user_tickets	
		has_many :tickets, :through => :user_tickets
		validates :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
		validates :phone,:presence => true,
							:numericality => true,
							:length => { :minimum => 9, :maximum => 12 }
		validates :password, with: /^[A-Za-z0-9]+$/,
							:length => { :minimum => 8, :maximum => 12 }
end
