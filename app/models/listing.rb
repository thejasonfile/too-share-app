class Listing < ApplicationRecord

  belongs_to :tool
  validates :name, presence: true
  validates :notes, length: {in: 1..250}
  # belongs_to :lender, :class_name => "User"

  def self.search(search)
     sql = <<-SQL
      SELECT * FROM listings
      JOIN tools ON listings.tool_id = tools.id
      JOIN users ON tools.lender_id = users.id
      WHERE UPPER(listings.name) LIKE UPPER('%#{search}%')
      OR users.zip_code = #{search.to_i}
      SQL

    self.find_by_sql(sql)
  end

  def find_lender
    self.tool.lender
  end

  def tool_name
    Tool.find(self.tool_id).name
  end

  def self.by_zip_code(zip_code)
    sql = <<-SQL
      SELECT users.zip_code, tools.name FROM listings
      JOIN tools ON listings.tool_id = tools.id
      JOIN users ON tools.lender_id = users.id
      WHERE users.zip_code = #{zip_code}
    SQL
    self.find_by_sql(sql)
  end

  def map_string
    @map_string = "https://maps.googleapis.com/maps/api/staticmap?center="
    @map_string += "#{self.find_lender.location}&zoom=13&size=400x400&"
    @map_string += "markers=color:blue%7Clabel:S"

    @map_string
  end

end
