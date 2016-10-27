class CreateBorrowerReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :borrower_reviews do |t|
      t.integer :rating
      t.string :content

      t.timestamps
    end
  end
end
