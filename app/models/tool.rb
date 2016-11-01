class Tool < ApplicationRecord
  has_many :reviews
  has_one :listing
  belongs_to :lender, :class_name => "User"
  validates :name, presence: true
  validates :safety_level, presence: true
  validates :condition, {presence: true, length: {in: 1..250}}


  def self.with_listings
    self.select do |tool|
      tool.has_listing?
    end
  end

  def without_listings
    self.select do |tool|
      !(tool.has_listing?)
    end
  end

  def has_listing?
    self.listing
  end

  def proper_tool_name(tool_name)
    tool_name.downcase.capitalize
  end


  def average_review
    if !self.reviews.empty?
      ratings_array = self.reviews.map do |review|
        review.rating
      end
      ((ratings_array.inject(:+)).to_f/(ratings_array.size).to_f).round(1)
    else
      "This has no reviews yet"
    end
  end

  def self.highest_rated
    sql = <<-SQL
    SELECT  AVG(reviews.rating) AS tool_rating_average, tools.name
    FROM reviews
    JOIN listings ON reviews.tool_id = listings.tool_id
    JOIN tools ON tools.id = listings.tool_id
    WHERE reviews.rating >= 4
    GROUP BY tools.name
    SQL
    tools = self.find_by_sql(sql)
    tools.map {|tool| tool.name}
  end

  def available?
    self.availability == "Available"
  end


end
