class Transaction < ApplicationRecord
  has_many :rentals
  validates :total_cost, presence: true
  
end
