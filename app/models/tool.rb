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

  def self.without_listings
    self.select do |tool|
      !(tool.has_listing?)
    end
  end

  def has_listing?
    self.listing
  end

  def average_review
    ratings_array = self.reviews.map do |review|
      review.rating
    end
    ratings_array.inject(:+)/ratings_array.size
  end

end
