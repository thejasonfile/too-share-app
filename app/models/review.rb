class Review < ApplicationRecord

  belongs_to :tool
  belongs_to :borrower, :class_name => "User"
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, lesser_than: 6 }
  validates :content, length: {in: 1..250}



  def worth_borrowing?
    if self.rating > 4
      "Yep!"
    else
      "Nah, don't bother"
    end
  end

  def solid_review
    self.content.size > 200
  end

  def self.number_of_reviews
    self.all.size
  end

  def self.number_of_solid_reviews
    self.all.select {|review| review.solid_review}.size
  end

end
