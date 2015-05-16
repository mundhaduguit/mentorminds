class PreChallenge < ActiveRecord::Base
  has_one :industry
  belongs_to :industry
  has_many :user_pre_challenges
  has_many :users , through: :user_pre_challenges
end
