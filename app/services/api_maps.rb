
class APIMaps
  def self.search(search)
     sql = <<-SQL
      SELECT listings.* FROM listings
      JOIN tools ON listings.tool_id = tools.id
      JOIN users ON tools.lender_id = users.id
      WHERE UPPER(listings.name) LIKE UPPER('%#{search}%')
      OR users.zip_code = #{search.to_i}
      SQL
    Listing.find_by_sql(sql)
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

end
