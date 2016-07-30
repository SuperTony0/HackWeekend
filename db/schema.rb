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

ActiveRecord::Schema.define(version: 20160730162036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "email"
    t.string   "image"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "join_table_trip_users", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "join_table_trip_users", ["trip_id"], name: "index_join_table_trip_users_on_trip_id", using: :btree
  add_index "join_table_trip_users", ["user_id"], name: "index_join_table_trip_users_on_user_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.integer  "capacity"
    t.string   "description"
    t.string   "location"
    t.string   "number"
    t.integer  "price"
    t.integer  "trip_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "owner_id"
  end

  add_index "rooms", ["owner_id"], name: "index_rooms_on_owner_id", using: :btree
  add_index "rooms", ["trip_id"], name: "index_rooms_on_trip_id", using: :btree

  create_table "spots", force: :cascade do |t|
    t.string   "description"
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string   "destination"
    t.string   "date_start"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "date_end"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "username"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "identities", "users"
  add_foreign_key "join_table_trip_users", "trips"
  add_foreign_key "join_table_trip_users", "users"
  add_foreign_key "rooms", "trips"
  add_foreign_key "rooms", "users", column: "owner_id"
  add_foreign_key "spots", "rooms"
end
