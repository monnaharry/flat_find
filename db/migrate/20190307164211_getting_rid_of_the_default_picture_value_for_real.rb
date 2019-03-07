class GettingRidOfTheDefaultPictureValueForReal < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profile_pic
    add_column :users, :profile_pic, :string
  end
end
