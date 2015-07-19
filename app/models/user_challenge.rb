class UserChallenge < ActiveRecord::Base
  before_save :set_score
  before_save :set_status

  resourcify
  belongs_to :user
  belongs_to :challenge
  has_one :user_answer

  def set_status
  	self.locked = "in progress"
  end

private

  def set_score
  	self.marks = 1000
  end
end