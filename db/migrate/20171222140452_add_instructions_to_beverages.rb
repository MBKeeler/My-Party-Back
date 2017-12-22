class AddInstructionsToBeverages < ActiveRecord::Migration[5.1]
  def change
    add_column :beverages, :instructions, :string
  end
end
