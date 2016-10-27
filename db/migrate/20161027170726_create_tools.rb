class CreateTools < ActiveRecord::Migration[5.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :safety_level
      t.string :portability
      t.boolean :rented_out
      t.date :rental_window
      t.string :condition
      t.integer :listing_id

      t.timestamps
    end
  end
end
