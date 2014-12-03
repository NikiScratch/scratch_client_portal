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

ActiveRecord::Schema.define(version: 20141203191439) do

  create_table "event_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "date"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
  end

  create_table "events_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "biolink"
    t.datetime "start"
    t.datetime "end"
  end

  create_table "events_venues", force: true do |t|
    t.integer  "venue_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "/"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "biolink"
    t.integer  "dj_cellphone"
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
