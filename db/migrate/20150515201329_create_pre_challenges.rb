class CreatePreChallenges < ActiveRecord::Migration
  def change
    create_table :pre_challenges do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
