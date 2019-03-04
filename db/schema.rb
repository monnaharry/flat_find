# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_04_163110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flats", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.integer "price"
    t.string "picture"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.boolean "status"
    t.integer "total_price"
    t.bigint "user_id"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_reservations_on_flat_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "email"
    t.text "password"
    t.date "birth_date"
    t.boolean "landlord"
    t.string "gender"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "flats", "users"
  add_foreign_key "reservations", "flats"
  add_foreign_key "reservations", "users"
end
