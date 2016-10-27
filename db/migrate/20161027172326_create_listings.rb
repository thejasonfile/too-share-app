class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer :cost
      t.string :notes
      t.integer :lender_id


      t.timestamps
    end
  end
end
