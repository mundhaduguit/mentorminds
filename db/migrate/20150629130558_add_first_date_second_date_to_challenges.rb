class AddFirstDateSecondDateToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :first_date, :integer
    add_column :challenges, :second_date, :integer
  end
end
