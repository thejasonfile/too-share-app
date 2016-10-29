class ChangeSafetyLevelDataTypeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :tools, :safety_level, :string
  end
end
