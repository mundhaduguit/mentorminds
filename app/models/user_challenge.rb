class UserChallenge < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :challenge
  has_many :user_answers

 end