class RemoveNameFromImages < ActiveRecord::Migration[6.0]
  def change
    remove_column :images, :image, :string
  end
end
