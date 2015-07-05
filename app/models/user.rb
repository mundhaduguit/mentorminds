class User < ActiveRecord::Base
  #after_create :set_flag
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pre_challenges, through: :user_pre_challenges
  has_many :user_pre_challenges
  has_many :challenges, :through => :user_challenges
  has_many :user_challenges
  has_many :user_accessed_industries

  def retrieve_industries
    u=self.user_challenges.collect(&:challenge_id).uniq
    UserChallenge.select("*,sum(marks) as marks").group(:user_id,:challenge_id).where(:challenge_id => u).all
  end

  def retrieve_industry_categories
    retrieve_industries
    industry_category_ids = "SELECT industry_category_id FROM industries WHERE id = (#{@industry_ids})"
    IndustryCategory.where("id IN (#{industry_category_ids})", id)
  end


  private
    def set_flag
      self.flag = true  
    end 
end
