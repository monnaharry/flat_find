class AddingDatesColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :dates, :string
  end
end
