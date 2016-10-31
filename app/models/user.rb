class User < ApplicationRecord
  has_secure_password
  has_many :rentals, :foreign_key => 'borrower_id'
  has_many :tools, :foreign_key => 'lender_id'
  has_many :listings, through: :tools
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :location, presence: true
  validates :zip_code, presence: true
  validates :zip_code, numericality: true
  validates :zip_code, length: { is: 5 } 

  def all_tools
    self.tools.map {|tool| tool}
  end

  def your_tools_without_listings
    self.tools.select do |tool|
      tool.listing == nil
    end
  end

  def all_reviews
    all_tools.map {|tool| tool.reviews}.flatten
  end

  def self.elite_users
    #users who have average review totals of 4 or higher
    
    #for each user, collect all reviews
    #Review.find_by_sql('SELECT tool_id, count(tool_id) FROM reviews GROUP BY tool_id')
    #average the rating for those reivews
    #if rating > 4 then user is elite
  end

end
