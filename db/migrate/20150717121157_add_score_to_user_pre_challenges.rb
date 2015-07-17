class AddScoreToUserPreChallenges < ActiveRecord::Migration
  def change
    add_column :user_pre_challenges, :score, :integer
  end
end
