class UserAnswer < ActiveRecord::Base

	#before_save :set_status_of_answer_done

	belongs_to :user
	belongs_to :challenge
	belongs_to :user_challenge
  attr_accessor :from_side

  has_attached_file :upload

  	def set_status_of_answer_done
  		self.status = "done"
  	end
end
