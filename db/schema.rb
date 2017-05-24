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

ActiveRecord::Schema.define(version: 20170524233140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consumptions", force: :cascade do |t|
    t.date     "date"
    t.string   "beverage_type"
    t.integer  "size"
    t.float    "cal"
    t.float    "caffeine"
    t.boolean  "disposable_cup"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.integer  "purchase_cup_id"
    t.integer  "purchase_pound_id"
  end

  create_table "purchase_cups", force: :cascade do |t|
    t.date     "date"
    t.float    "price"
    t.string   "brand"
    t.integer  "rating"
    t.boolean  "fair_trade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "purchase_pounds", force: :cascade do |t|
    t.date     "date"
    t.float    "price"
    t.string   "brand"
    t.integer  "rating"
    t.boolean  "fair_trade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
