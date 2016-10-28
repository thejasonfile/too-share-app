class AddAvailabilityStartToTools < ActiveRecord::Migration[5.0]
  def change
    add_column :tools, :availability_start, :date
  end
end
