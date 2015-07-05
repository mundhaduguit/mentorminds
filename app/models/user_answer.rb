class UserAnswer < ActiveRecord::Base
	belongs_to :user
	belongs_to :challenge
	belongs_to :user_challenge
  attr_accessor :from_side
end
