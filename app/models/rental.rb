class Rental < ApplicationRecord
  belongs_to :listing
  belongs_to :borrower, :class_name => "User"

  def find_lender
    
  end

end
