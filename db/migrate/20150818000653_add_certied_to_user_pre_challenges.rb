class AddCertiedToUserPreChallenges < ActiveRecord::Migration
  def change
    add_column :user_pre_challenges, :certified, :boolean
  end
end
