class AddDefaultValueToStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :status, :string, default: "Pending"
  end
end
