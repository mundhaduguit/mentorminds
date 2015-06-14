class AddFlagToUser < ActiveRecord::Migration
	#flag is used for routing purpose to redirect to user/edit page or progress page
  def change
    add_column :users, :flag, :boolean, default: false
  end
end
