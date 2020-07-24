class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      
      t.string :send_last_name,       null: false
      t.string :send_first_name,      null: false
      t.string :send_last_name_kana,  null: false
      t.string :send_first_name_kana, null: false

      t.integer :postal_code,         null: false
      t.integer :prefecture_id,       null: false
      t.string :city,                 null: false
      t.integer :house_number,        null: false
      t.integer :room_number

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
