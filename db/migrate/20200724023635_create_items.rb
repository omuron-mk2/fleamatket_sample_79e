class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false
      t.text :text,                   null: false
      t.string :price,                null: false
      t.string :condition,            null: false
      t.integer :delivery_fee,        null: false
      t.integer :prefecture_id,       null: false
      t.string :days,                 null: false

      # t.references :user, type: :bigint,         foreign_key: true
      t.bigint :user_id
      t.timestamps
    end
    add_foreign_key :items, :users
  end
end