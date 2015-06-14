class UserAccessedIndustry < ActiveRecord::Base
	belongs_to :industry_category
	belongs_to :user

	def self.create_user_accessed_industry(user_id, industry_category_id)
		user_accessed_industry = where("user_id = ? AND industry_category_id = ?", user_id, industry_category_id).first
		if user_accessed_industry.blank?
			create(user_id: user_id, industry_category_id: industry_category_id)
		else
			user_accessed_industry.update_attribute(:updated_at, Time.now)
		end
	end

	def self.get_user_accessed_industries(user_id)
		includes(:industry_category).where(user_id: user_id).order("updated_at DESC")
	end
end