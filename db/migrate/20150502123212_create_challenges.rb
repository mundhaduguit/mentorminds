class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :question
      t.text :answer

      t.timestamps null: false
    end
  end
end
