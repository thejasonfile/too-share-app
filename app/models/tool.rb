class Tool < ApplicationRecord
  has_many :reviews
  has_one :listing
  belongs_to :lender, :class_name => "User"

  def self.with_listings
    self.select do |tool|
      tool.has_listing?
    end
  end

  def has_listing?
    self.listing
  end

end
