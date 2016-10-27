class CreateLenderLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :lender_locations do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end
end
