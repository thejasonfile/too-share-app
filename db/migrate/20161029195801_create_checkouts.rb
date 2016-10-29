class CreateCheckouts < ActiveRecord::Migration[5.0]
  def change
    create_table :create_checkouts do |t|
      t.integer :total_cost
      t.timestamps
    end
  end
end
