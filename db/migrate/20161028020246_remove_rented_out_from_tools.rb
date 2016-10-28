class RemoveRentedOutFromTools < ActiveRecord::Migration[5.0]
  def change
    remove_column :tools, :rented_out, :boolean
  end
end
