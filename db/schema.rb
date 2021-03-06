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

ActiveRecord::Schema.define(version: 20150630122800) do

  create_table "meetings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.string   "place_meeting"
    t.string   "language"
    t.string   "city"
    t.datetime "date"
    t.text     "participants"
    t.string   "part_confirm"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "image_meeting"
  end

  create_table "opinions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "city"
    t.string   "address"
    t.float    "average_place"
    t.string   "timetable"
    t.text     "offers"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image_offer"
    t.string   "image_place"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "nick"
    t.string   "email"
    t.string   "password_digest"
    t.float    "average_user"
    t.string   "city"
    t.integer  "age"
    t.string   "job"
    t.string   "languages_learnt"
    t.string   "languages_without_learning"
    t.text     "hobbies"
    t.text     "participants_in_rating"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "image"
  end

end
