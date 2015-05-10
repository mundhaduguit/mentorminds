class AddPaperClipFieldsToIndustryCategories < ActiveRecord::Migration
  def change
    add_attachment :industry_categories, :image
  end
end
