class User < ActiveRecord::Base
  #after_create :set_flag
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
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

  def self.process_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.user_name = auth.info.nickname
      user.email = auth.info.email
    end
  end
=begin
We must tell Devise to automatically preload forms with attributes that were stored
in the session if these attributes are available. To do this, we can override Devise's
new_with_session class method in our User model
=end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
# => Devise can skip password validation if the provider field isn't blank
  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank? && provider.present?
      update_attributes(params, *options)
    else
      super
    end
  end


  private
    def set_flag
      self.flag = true  
    end 
end
