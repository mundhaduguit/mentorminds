class UserChallenge < ActiveRecord::Base
  before_save :set_score
  before_create :set_status_progress #executes only first time when the object is instantiated
  #before_save :user_answer_status_done # in user answer table

  resourcify
  belongs_to :user
  belongs_to :challenge
  belongs_to :user_pre_challenge
  has_one :user_answer

  def set_status_progress
  	self.locked = "in progress"
  end

  def set_status_answered
  	self.locked = "done"
  end


  def user_answer_status_done

	   	query = "select status from user_answers where (user_id AND user_challenge_id) = (#{self.id} AND #{self.user_id})"
	  	a = UserAnswer.where("status IN #{query}")
	  	return true

  end

	private

	  def set_score
	  	self.marks = 1000
	  end
end
