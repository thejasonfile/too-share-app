class AddToolIdToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :tool_id, :integer
  end
end
