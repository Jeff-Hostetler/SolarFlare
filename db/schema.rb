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

ActiveRecord::Schema.define(version: 20141218230100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sensors", force: true do |t|
    t.integer  "data_point"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "sensors", ["user_id"], name: "index_sensors_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "project_name"
    t.boolean "join_mailing_list"
    t.string  "password_digest"
    t.string  "address"
    t.string  "address_city"
    t.string  "address_state"
    t.string  "address_zip"
    t.string  "phone_number"
    t.boolean "text_alert"
    t.boolean "email_alert"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "arduino_serial_port"
    t.string  "serial_port"
    t.boolean "admin",               default: false
  end

end
