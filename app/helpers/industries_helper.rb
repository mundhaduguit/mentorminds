module IndustriesHelper
	def find_industries(industry_id)
	  Industry.joins(pre_challenges: {challenges: {user_challenges: :user_answers}}).where("industries.industry_category_id = ? ",industry_id).uniq
	end
end