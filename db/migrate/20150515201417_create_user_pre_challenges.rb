class CreateUserPreChallenges < ActiveRecord::Migration
  def change
    create_table :user_pre_challenges do |t|
      t.integer :user_id
      t.integer :pre_challenge_id

      t.timestamps null: false
    end
  end
end
