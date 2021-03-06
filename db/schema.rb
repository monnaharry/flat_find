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

ActiveRecord::Schema.define(version: 2019_03_08_125602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flats", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.integer "price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bathroom"
    t.integer "bed"
    t.boolean "kitchen"
    t.boolean "common_area"
    t.string "room_type"
    t.integer "guest"
    t.string "property_type"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_images_on_flat_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "status", default: "Pending"
    t.integer "total_price"
    t.bigint "user_id"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dates"
    t.index ["flat_id"], name: "index_reservations_on_flat_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birth_date"
    t.boolean "landlord", default: false
    t.string "gender"
    t.string "phone_number"
    t.string "name"
    t.string "profile_pic"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "flats", "users"
  add_foreign_key "images", "flats"
  add_foreign_key "reservations", "flats"
  add_foreign_key "reservations", "users"
end
