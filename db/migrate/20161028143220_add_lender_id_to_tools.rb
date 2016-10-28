class AddLenderIdToTools < ActiveRecord::Migration[5.0]
  def change
    add_column :tools, :lender_id, :integer
  end
end
