class UserChallenge < ActiveRecord::Base
	resourcify
  belongs_to :user
  belongs_to :challenge
  has_many :events, class_name: "UserChallengeEvent"

  STATES = %w[locked unlocked answering reviewed checked answer_again]
  delegate :locked?, :unlocked?, :answering?, :reviewed?, :checked?, :failed?, to: :current_state

  def self.open_user_challenge #for db querying
  	joins(:events).merge UserChallengeEvent.with_last_state("unlocked")
  end

  def current_state
  	(events.last.try(:state) || STATES.first).inquiry
  end

  def solution(valid_solution = true)
  	if locked?
  		events.create! state: "answering" if valid_solution
  	end
  end

  def review
  	events.create! state: "reviewed" if answering?
  end

  def pass
  	events.create! state: "checked" if reviewed?
  end

  def fail
  	events.create! state: "answer_again" if reviewed?
  end

 end