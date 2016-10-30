class Listing < ApplicationRecord
has_one :tool
  validates :name, presence: true
  validates :cost, presence: true
  validates :notes, length: {in: 1..250}
  # belongs_to :lender, :class_name => "User"

  def self.search(search)
     sql = <<-SQL
      SELECT * FROM listings
      WHERE UPPER(listings.name)
      LIKE UPPER('%#{search}%')
      SQL
    self.find_by_sql(sql)
  end

  def tool_name
    Tool.find(self.tool_id).name
  end

end
