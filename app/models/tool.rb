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

  def average_review
    if self.reviews != nil
      ratings_array = self.reviews.map do |review|
        review.rating
      end
      (ratings_array.inject(:+)).to_f/(ratings_array.size).to_f
    else
      "This has no reviews yet"
    end
  end

  

end
