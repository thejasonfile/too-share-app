class AddToolIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :tool_id, :integer
  end
end
