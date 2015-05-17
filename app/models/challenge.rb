class Challenge < ActiveRecord::Base
  has_one :industry
  belongs_to :industry
  has_many :user_challenges
  has_many :users, :through => :user_challenges
end
