class Event < ActiveRecord::Base
	
	has_many :eventusers
	has_many :users, through: :eventusers
	has_many :comments
end
