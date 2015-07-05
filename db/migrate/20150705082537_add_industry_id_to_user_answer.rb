class AddIndustryIdToUserAnswer < ActiveRecord::Migration
  def change
    add_column :user_answers, :industry_id, :integer
  end
end
