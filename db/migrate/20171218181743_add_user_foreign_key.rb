class AddUserForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_reference :beverages, :users, foreign_key: true
  end
end
