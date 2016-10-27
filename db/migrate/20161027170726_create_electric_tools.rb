class CreateElectricTools < ActiveRecord::Migration[5.0]
  def change
    create_table :electric_tools do |t|
      t.string :name
      t.integer :difficulty
      t.integer :safety_level
      t.string :portability
      t.boolean :rented_out
      t.date :rental_window
      t.string :condition

      t.timestamps
    end
  end
end
