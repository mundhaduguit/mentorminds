class AddAttachmentUploadesToUserPreChallenges < ActiveRecord::Migration
  def up
    add_attachment :user_pre_challenges, :upload
  end

  def down
    remove_attachment :user_pre_challenges, :upload
  end
end
