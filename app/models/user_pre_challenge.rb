class UserPreChallenge < ActiveRecord::Base
	resourcify
  belongs_to :user
  belongs_to :pre_challenge
  has_many :user_challenges
  has_attached_file :upload,  :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :upload, :content_type => /\Aimage\/.*\Z/
end
