class UserPreChallenge < ActiveRecord::Base
  belongs_to :user
  belongs_to :pre_challenge
end
