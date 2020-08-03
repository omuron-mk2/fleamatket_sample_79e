class ChangeProfileImageColumnInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :profile_image, :profile_image_id
  end
end
