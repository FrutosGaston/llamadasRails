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

ActiveRecord::Schema.define(version: 20161206150641) do

  create_table "billers", force: :cascade do |t|
    t.string   "cost_types"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.datetime "since"
    t.datetime "till"
    t.integer  "biller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["biller_id"], name: "index_bills_on_biller_id"
  end

  create_table "calls", force: :cascade do |t|
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.datetime "when_was"
    t.integer  "last"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["destination_id"], name: "index_calls_on_destination_id"
    t.index ["origin_id"], name: "index_calls_on_origin_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "pais"
    t.string   "ciudad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
