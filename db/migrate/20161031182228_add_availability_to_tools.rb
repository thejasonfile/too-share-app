class AddAvailabilityToTools < ActiveRecord::Migration[5.0]
  def change
    add_column :tools, :availability, :string, default: "Available"
  end
end
