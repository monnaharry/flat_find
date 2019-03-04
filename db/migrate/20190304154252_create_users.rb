class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :email
      t.text :password
      t.date :birth_date
      t.boolean :landlord
      t.string :gender
      t.string :phone_number

      t.timestamps
    end
  end
end
