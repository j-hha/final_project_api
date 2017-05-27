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

ActiveRecord::Schema.define(version: 20170527025009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "nutrients", force: :cascade do |t|
    t.string   "beverage_type"
    t.float    "cal"
    t.float    "caffeine"
    t.float    "sugar"
    t.float    "fat"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "unit"
  end

  create_table "purchases", force: :cascade do |t|
    t.boolean  "by_cup"
    t.date     "date"
    t.float    "price"
    t.string   "brand"
    t.integer  "rating"
    t.boolean  "fair_trade", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "servings", force: :cascade do |t|
    t.date     "date"
    t.string   "beverage_type"
    t.integer  "size"
    t.float    "cal"
    t.float    "caffeine"
    t.float    "sugar"
    t.boolean  "disposable_cup"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "purchase_id"
    t.float    "fat"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
