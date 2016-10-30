class DropTableCheckouts < ActiveRecord::Migration[5.0]
  def change
    drop_table :checkouts
  end
end
