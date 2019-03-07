class GettingRidOfTheDefaultPictureValue < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :profile_pic, :string
  end
end
