class Rental < ApplicationRecord
  belongs_to :listing
  belongs_to :borrower, :class_name => "User"

  def find_tool
    Tool.find(self.listing.tool_id).name
  end

end
