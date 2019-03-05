class AddUserLandlordDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :landlord, :boolean, default: false
  end
end
