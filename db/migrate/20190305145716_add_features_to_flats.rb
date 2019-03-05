class AddFeaturesToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :bathroom, :integer
    add_column :flats, :bed, :integer
    add_column :flats, :kitchen, :boolean
    add_column :flats, :common_area, :boolean
    add_column :flats, :room_type, :string
    add_column :flats, :guest, :integer
    add_column :flats, :property_type, :string
  end
end
