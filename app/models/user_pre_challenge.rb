class UserPreChallenge < ActiveRecord::Base
	resourcify
  belongs_to :user
  belongs_to :pre_challenge
  has_many :user_challenges
  has_attached_file :upload,  :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :upload, :content_type => /\Aimage\/.*\Z/

  def self.get_all_scores
    all_scores = {}
    User.all.each{|user|
      all_scores[user] = user.user_pre_challenges.collect(&:score).reject { |c| c.blank? }.inject(:+)
    }
    all_scores.sort_by {|_key, value| value}.reverse
  end
 def self.get_all_scores_by_id
   all_scores = {}
   User.all.each{|user|
     all_scores[user.id] = user.user_pre_challenges.collect(&:score).reject { |c| c.blank? }.inject(:+)
   }
   all_scores

 end
end
