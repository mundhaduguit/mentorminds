class IndustryCategory < ActiveRecord::Base
  resourcify
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  acts_as_tree
  belongs_to :industry
  has_many :industries
  has_many :user_accessed_industries
end
