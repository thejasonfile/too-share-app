class RemoveAvailabilityStartFromTools < ActiveRecord::Migration[5.0]
  def change
    remove_column :tools, :availability_start, :integer
    remove_column :tools, :availability_end, :integer
  end
end
