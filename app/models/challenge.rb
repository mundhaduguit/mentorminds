class Challenge < ActiveRecord::Base
  resourcify
  belongs_to :pre_challenge
  belongs_to :industry
  has_many :user_challenges
  has_many :users, :through => :user_challenges
end
