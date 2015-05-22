class UserPreChallenge < ActiveRecord::Base
	resourcify
  belongs_to :user
  belongs_to :pre_challenge
end
