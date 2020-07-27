class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :user,          foreign_key: true
      t.integer :card_number,      null:false
      t.integer :customer_id
      t.timestamps
    end
  end
end
