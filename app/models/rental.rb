class Rental < ApplicationRecord
  belongs_to :listing
  belongs_to :borrower, :class_name => "User"
  belongs_to :transaction
end
