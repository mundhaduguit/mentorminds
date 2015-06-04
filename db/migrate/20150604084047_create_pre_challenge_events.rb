class CreatePreChallengeEvents < ActiveRecord::Migration
  def change
    create_table :pre_challenge_events do |t|
    	t.belongs_to :pre_challenge
      t.string :state

      t.timestamps null: false
    end
    add_index :pre_challenge_events, :pre_challenge_id
  end
end
