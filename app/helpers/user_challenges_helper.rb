module UserChallengesHelper

	def current_user_total_score
		b = 0
		current_user.user_challenges.each do |x|
			b += x.marks if x.marks != nil
		end
		return b
	end
end
