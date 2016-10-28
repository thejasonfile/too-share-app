class Tool < ApplicationRecord
  has_many :reviews
  has_one :listing
  # belongs_to :lender, :class_name => "User"
end
