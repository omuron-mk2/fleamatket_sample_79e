class AddBrandIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :brand, foreign_key: true
  end
end
