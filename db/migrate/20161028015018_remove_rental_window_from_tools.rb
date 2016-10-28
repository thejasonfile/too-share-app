class RemoveRentalWindowFromTools < ActiveRecord::Migration[5.0]
  def change
    remove_column :tools, :rental_window, :date
  end
end
