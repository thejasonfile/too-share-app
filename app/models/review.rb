class Review < ApplicationRecord

belongs_to :tool
validates :rating, presence: true
validates :rating, numericality: { only_integer: true, greater_than: 0, lesser_than: 6 }
validates :content, length: {in: 1..250}

  def average_review
    @tool = Tool.find(self.tool_id)
    ratings_array = @tool.reviews.map do |review|
      review.rating
    end
    ratings_array.inject(:+)/ratings_array.size
  end

  def worth_borrowing
  end
end  
