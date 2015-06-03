class CreateUserChallengeEvents < ActiveRecord::Migration
  def change
    create_table :user_challenge_events do |t|
      t.belongs_to :user_challenge
      t.string :state

      t.timestamps null: false
    end
    add_index :user_challenge_events, :user_challenge_id
  end
end
