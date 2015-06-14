class CreateUserAccessedIndustries < ActiveRecord::Migration
  def change
    create_table :user_accessed_industries do |t|
      t.integer :industry_category_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
