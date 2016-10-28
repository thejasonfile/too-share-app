class AddAvailabilityEndToTools < ActiveRecord::Migration[5.0]
  def change
    add_column :tools, :availability_end, :date
  end
end
