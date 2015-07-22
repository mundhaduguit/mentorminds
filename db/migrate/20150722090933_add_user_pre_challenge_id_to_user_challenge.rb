class AddUserPreChallengeIdToUserChallenge < ActiveRecord::Migration
  def change
    add_column :user_challenges, :user_pre_challenge_id, :integer
  end
end
