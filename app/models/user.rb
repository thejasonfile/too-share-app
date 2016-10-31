class User < ApplicationRecord
  has_secure_password
  has_many :rentals, :foreign_key => 'borrower_id'
  has_many :tools, :foreign_key => 'lender_id'
  has_many :listings, through: :tools
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :location, presence: true

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
    review_group = User.all.map { |user| 
      [user.id, user.all_reviews.flatten] 
      }
    #average the rating for those reivews
    #if rating > 4 then user is elite
  end

end
