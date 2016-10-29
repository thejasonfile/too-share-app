class Listing < ApplicationRecord
  has_one :tool
  # belongs_to :lender, :class_name => "User"

  def self.search(search)
     sql = <<-SQL
      SELECT * FROM listings 
      JOIN tools ON listings.tool_id = tools.id
      WHERE listings.name 
      LIKE '%#{search}%' OR tools.name LIKE '%#{search}%'
      SQL
    self.find_by_sql(sql)
  end

end


