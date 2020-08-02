class ChangeBirthInUsers < ActiveRecord::Migration[6.0]
  def change
    remove_columns :users, :birth_year, :birth_month, :birth_day
    add_column :users, :birth_date, :date, null: false
  end
end
