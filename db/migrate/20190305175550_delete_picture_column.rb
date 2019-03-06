class DeletePictureColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :flats, :picture
  end
end
