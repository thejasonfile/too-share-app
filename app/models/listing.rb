class Listing < ApplicationRecord
  has_one :tool
  # belongs_to :lender, :class_name => "User"

  def self.search(search)
     sql = <<-SQL
      SELECT * FROM listings 
      WHERE UPPER(listings.name)
      LIKE UPPER('%#{search}%')
      SQL
    self.find_by_sql(sql)
  end

end


