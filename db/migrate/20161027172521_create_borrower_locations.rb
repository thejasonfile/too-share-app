class CreateBorrowerLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :borrower_locations do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end
end
