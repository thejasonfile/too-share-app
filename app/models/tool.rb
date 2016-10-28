class Tool < ApplicationRecord
  has_many :reviews
  belongs_to :lender, :class_name => "User"
end
