class Challenge < ActiveRecord::Base
	before_save :set_industry_id 
  resourcify
  belongs_to :pre_challenge
  belongs_to :industry
  has_many :user_challenges
  has_many :users, :through => :user_challenges

  def set_industry_id
  	ids = "Select industry_id from pre_challenges where id = #{self.pre_challenge_id} "
  	industry_id_in_challenge = Industry.where("id IN (#{ids})").take.id
  	self.industry_id = industry_id_in_challenge
  end
end
