module UserChallengesHelper

	def current_user_total_score
		b = 0
		current_user.user_pre_challenges.each do |x|
			b += x.score if x.score != nil
		end
		return b
	end
end
