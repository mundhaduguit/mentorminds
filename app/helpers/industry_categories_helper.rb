module IndustryCategoriesHelper
	def find_industry_category(industry_category_id)
		IndustryCategory.where(id: industry_category_id).first
	end
end
