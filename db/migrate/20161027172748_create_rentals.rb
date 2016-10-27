class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.integer :borrower_id
      t.integer :listing_id
      t.integer :transaction_id

      t.timestamps
    end
  end
end
