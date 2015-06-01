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

ActiveRecord::Schema.define(version: 20150601150645) do

  create_table "meetings", force: :cascade do |t|
    t.integer  "user_registered_id"
    t.string   "address"
    t.string   "language"
    t.datetime "date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.string   "city"
    t.string   "address"
    t.text     "offers"
    t.text     "opinions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_not_registereds", force: :cascade do |t|
    t.string   "nick"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_registereds", force: :cascade do |t|
    t.string   "name"
    t.string   "nick"
    t.string   "password"
    t.string   "email"
    t.float    "rating"
    t.string   "city"
    t.integer  "age"
    t.string   "job"
    t.string   "languages_learnt"
    t.string   "languages_without_learning"
    t.text     "hobbies"
    t.string   "photo"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
