class AddIndustryIdToPreChallenge < ActiveRecord::Migration
  def change
    add_column :pre_challenges, :industry_id, :integer
  end
end
