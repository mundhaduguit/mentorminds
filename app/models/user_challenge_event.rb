class UserChallengeEvent < ActiveRecord::Base
	belongs_to :user_challenge

	validates_presence_of :user_challenge_id
	validates_inclusion_of :state, in: UserChallenge::STATES

	def self.with_last_state(state)
		user_challenge("id desc").group("order_id").having(state: state)
	end
end
