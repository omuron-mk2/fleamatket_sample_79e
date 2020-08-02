class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :buyer_id,                 foreign_key: true
      t.integer :seller_id,  null: false,  foreign_key: true
      t.references :item,    null: false,  foreign_key: true
      t.references :card,    null: false,  foreign_key: true
      t.timestamps
    end
  end
end
