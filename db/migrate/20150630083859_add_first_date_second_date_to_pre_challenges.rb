class AddFirstDateSecondDateToPreChallenges < ActiveRecord::Migration
  def change
    add_column :pre_challenges, :first_date, :integer
    add_column :pre_challenges, :second_date, :integer
  end
end
