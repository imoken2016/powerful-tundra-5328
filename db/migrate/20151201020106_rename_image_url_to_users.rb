class RenameImageUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    remove_column :users, :image_url, :string
  end
end
