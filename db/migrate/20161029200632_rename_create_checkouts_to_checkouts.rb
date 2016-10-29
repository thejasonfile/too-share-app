class RenameCreateCheckoutsToCheckouts < ActiveRecord::Migration[5.0]
  def change
    rename_table :create_checkouts, :checkouts
  end
end
