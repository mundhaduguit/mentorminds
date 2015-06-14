class PreChallengeEvent < ActiveRecord::Base
	belongs_to :pre_challenge
	validates_presence_of :pre_challenge_id
	validates_inclusion_of :state, in: PreChallenge::STATES

	def self.with_last_state(state)
		pre_challenge("id desc").group("pre_challenge_id").having(state: state)
	end
end
