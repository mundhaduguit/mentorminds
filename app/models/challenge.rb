class Challenge < ActiveRecord::Base
  has_one :industry
  belongs_to :industry
end
