class UserAnswer < ActiveRecord::Base
	before_save :update_marks
	before_save :set_status_of_answer_done

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
end
