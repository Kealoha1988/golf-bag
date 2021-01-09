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

ActiveRecord::Schema.define(version: 20210109163617) do

  create_table "bags", force: :cascade do |t|
    t.string   "name"
    t.string   "club_1"
    t.string   "club_2"
    t.string   "club_3"
    t.string   "club_4"
    t.string   "club_5"
    t.string   "club_6"
    t.string   "club_7"
    t.string   "club_8"
    t.string   "club_9"
    t.string   "club_10"
    t.string   "club_11"
    t.string   "club_12"
    t.string   "club_13"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "club_14"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
