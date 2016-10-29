class Listing < ApplicationRecord
  has_one :tool
  # belongs_to :lender, :class_name => "User"

end


