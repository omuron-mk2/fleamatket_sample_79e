class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false
      t.text :text,                   null: false
      t.string :price,                null: false
      t.string :condition,            null: false
      t.string :delivery_fee,         null: false
      t.integer :prefecture_id,       null: false
      t.string :days,                 null: false
      t.string :status,               null: false
      
      t.references :seller, null: false, foreign_key: {to_table: :users} 
      t.references :buyer, foreign_key: {to_table: :users} 
      t.timestamps
    end
  end
end