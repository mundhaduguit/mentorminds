class UserAnswer < ActiveRecord::Base
	belongs_to :challenge
	belongs_to :user_challenge
end
