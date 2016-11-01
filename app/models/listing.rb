class Listing < ApplicationRecord

  belongs_to :tool
  validates :name, presence: true
  validates :notes, length: {in: 1..250}
  # belongs_to :lender, :class_name => "User", through: tool

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
    #test : given this tool, find a lender
  end

  def tool_name
    Tool.find(self.tool_id).name
  end

  # def self.by_zip_code(zip_code)
  #   sql = <<-SQL
  #     SELECT users.zip_code, tools.name FROM listings
  #     JOIN tools ON listings.tool_id = tools.id
  #     JOIN users ON tools.lender_id = users.id
  #     WHERE users.zip_code = #{zip_code}
  #   SQL
  #   self.find_by_sql(sql)
  # end

  def is_integer?
    self.to_i.to_s == self
  end

  def available_listing
    self.tool.availability == "Available"
  end

  def select_available_listings(list)
    list.select {|listing| listing.tool.availability == "Available" }
  end


end
