class CreateBeverages < ActiveRecord::Migration[5.1]
  def change
    create_table :beverages do |t|
      t.string :name
      t.string :description
      t.string :recipe
      t.integer :rating
      t.string :occassion

      t.timestamps
    end
  end
end
