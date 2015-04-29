class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :name
      t.string :description
      t.integer :industry_category_id

      t.timestamps null: false
    end
  end
end
