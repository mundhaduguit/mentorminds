class AddMarksToUserAnswers < ActiveRecord::Migration
  def change
    add_column :user_answers, :marks, :decimal
  end
end
