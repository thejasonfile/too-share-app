class AddBorrowerIdToTools < ActiveRecord::Migration[5.0]
  def change
    add_column :tools, :borrower_id, :integer
  end
end
