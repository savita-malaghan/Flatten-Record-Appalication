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

ActiveRecord::Schema.define(version: 20150424111001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "denormalized_orders", force: true do |t|
    t.integer  "order_id"
    t.string   "discount"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.string   "customer_name"
    t.datetime "customer_created_at"
    t.datetime "customer_updated_at"
    t.integer  "line_item_id"
    t.string   "line_item_description"
    t.integer  "line_item_total"
    t.integer  "line_item_order_id"
    t.datetime "line_item_created_at"
    t.datetime "line_item_updated_at"
    t.decimal  "total_in_usd"
    t.decimal  "line_items_sum"
  end

  create_table "line_items", force: true do |t|
    t.string   "description"
    t.integer  "total"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "customer_id"
    t.string   "discount"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
