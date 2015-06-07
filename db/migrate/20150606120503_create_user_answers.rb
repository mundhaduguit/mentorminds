class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.text :answer
      t.integer :user_id, index: true
      t.integer :user_challenge_id, index: true

      t.timestamps null: false
    end

    add_foreign_key :user_answers, :user_challenges
  end
end
