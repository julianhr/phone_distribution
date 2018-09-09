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

ActiveRecord::Schema.define(version: 2018_09_09_035526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "area_codes", force: :cascade do |t|
    t.integer "code", null: false
    t.bigint "zip_code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zip_code_id"], name: "index_area_codes_on_zip_code_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "zip_codes", force: :cascade do |t|
    t.integer "code"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_zip_codes_on_city_id"
    t.index ["code"], name: "index_zip_codes_on_code", unique: true
  end

  add_foreign_key "area_codes", "zip_codes"
  add_foreign_key "cities", "states"
  add_foreign_key "zip_codes", "cities"
end
