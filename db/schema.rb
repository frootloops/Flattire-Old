# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160221183346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "cube"
  enable_extension "earthdistance"

  create_table "drivers", force: :cascade do |t|
    t.string   "email",                default: "", null: false
    t.string   "name",                 default: "", null: false
    t.string   "phone",                default: "", null: false
    t.string   "encrypted_password",   default: "", null: false
    t.string   "otp_secret_key"
    t.integer  "otp_counter"
    t.string   "authentication_token", default: "", null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "drivers", ["authentication_token"], name: "index_drivers_on_authentication_token", unique: true, using: :btree
  add_index "drivers", ["phone"], name: "index_drivers_on_phone", unique: true, using: :btree

  create_table "spatial_ref_sys", primary_key: "srid", force: :cascade do |t|
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

end
