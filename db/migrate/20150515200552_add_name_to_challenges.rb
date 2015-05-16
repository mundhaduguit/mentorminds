class AddNameToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :pre_challenge_id, :integer
    
  end
end
