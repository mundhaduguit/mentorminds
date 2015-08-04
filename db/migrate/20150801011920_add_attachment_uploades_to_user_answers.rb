class AddAttachmentUploadesToUserAnswers < ActiveRecord::Migration
  def self.up
    change_table :user_answers do |t|
      t.attachment :uploades
    end
  end

  def self.down
    remove_attachment :user_answers, :uploades
  end
end
