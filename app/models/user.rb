class User < ApplicationRecord
  has_secure_password
  has_many :rentals, :foreign_key => 'borrower_id'
  has_many :tools, :foreign_key => 'lender_id'
  has_many :listings, through: :tools
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :location, presence: true

  def your_tools_without_listings
    self.tools.select do |tool|
      tool.listing == nil
    end
  end

  def elite?
    a = user.tools.map {|tool| tool.reviews }
    a.flatten.map
  end

end
