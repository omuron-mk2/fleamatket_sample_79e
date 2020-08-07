class ChangeItemPrice < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :price, :integer, null: false
  end
end
