class Review < ApplicationRecord

belongs_to :tool
validates :rating, presence: true
validates :rating, numericality: { only_integer: true, greater_than: 0, lesser_than: 6 }
validates :content, length: {in: 1..250}

end
