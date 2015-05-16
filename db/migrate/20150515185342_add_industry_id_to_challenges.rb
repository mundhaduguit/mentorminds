class AddIndustryIdToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :industry_id, :integer
  end
end
