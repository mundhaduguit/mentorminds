class Industry < ActiveRecord::Base
	resourcify
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :industry_category
  has_many :challenges
  has_many :pre_challenges
  belongs_to :pre_challenge
  scope  :get_all_industry_names_to_select, ->{ pluck(:name, :id) }
end
