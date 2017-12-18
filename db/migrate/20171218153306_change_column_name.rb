class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :beverages, :occassion, :occasion
  end
end
