class AddMultiPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :flats, :picture
    add_column :flats, :pictures, :string, default: [], array:true
  end
end
