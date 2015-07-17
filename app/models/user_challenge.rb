class UserChallenge < ActiveRecord::Base
  before_save :set_score

  resourcify
  belongs_to :user
  belongs_to :challenge
  has_one :user_answer

private

  def set_score
  	self.marks = 1000
  end
 end