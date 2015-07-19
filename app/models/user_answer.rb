class UserAnswer < ActiveRecord::Base
	before_save :update_marks
	before_save :set_status_of_answer_done
	#before_save :user_challenge_status_done

	belongs_to :user
	belongs_to :challenge
	belongs_to :user_challenge
  attr_accessor :from_side

  	def update_marks
  		self.marks = 1000
  	end

  	def set_status_of_answer_done
  		self.status = "done"
  	end

  	def user_challenge_status_done
	  	query = "select status from user_answers where (#{self.user_challenge_id} AND #{self.user_id}) = 
	  											(select (user_id AND user_challenge_id) from user_challenges )"
	  	a = UserAnswer.where("status IN (#{query})").take.status
	end
end
