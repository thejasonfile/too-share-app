class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.integer :lender_id

      t.timestamps
    end
  end
end
