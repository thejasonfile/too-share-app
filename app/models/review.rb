class Review < ApplicationRecord

belongs_to :tool
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


end
