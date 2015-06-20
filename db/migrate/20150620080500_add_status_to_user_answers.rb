class AddStatusToUserAnswers < ActiveRecord::Migration
  def change
    add_column :user_answers, :status, :string
  end
end
