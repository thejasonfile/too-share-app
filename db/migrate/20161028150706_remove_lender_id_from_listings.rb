class RemoveLenderIdFromListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :lender_id, :integer
  end
end
