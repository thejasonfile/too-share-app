class RemoveListingIdFromTools < ActiveRecord::Migration[5.0]
  def change
    remove_column :tools, :listing_id, :integer
  end
end
