class AddDefaultPictures < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :profile_pic, :string, default: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'
  end
end
