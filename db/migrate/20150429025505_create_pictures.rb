class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :imageable_id
      t.string :imageable_type

      t.timestamps null: false
    end
    add_attachment :pictures, :image
    add_attachment :industries, :image
  end
end
