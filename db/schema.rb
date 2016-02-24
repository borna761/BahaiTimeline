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

ActiveRecord::Schema.define(version: 20160224170311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "eventgroups", force: :cascade do |t|
    t.string   "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "startYear"
    t.integer  "startMonth"
    t.integer  "startDay"
    t.time     "startTime"
    t.integer  "endYear"
    t.integer  "endMonth"
    t.integer  "endDay"
    t.time     "endTime"
    t.date     "displayDate"
    t.string   "headline"
    t.text     "text"
    t.string   "media"
    t.string   "mediaCredit"
    t.string   "mediaCaption"
    t.string   "mediaThumbnail"
    t.string   "background"
    t.integer  "eventtype_id"
    t.integer  "eventgroup_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "events", ["eventgroup_id"], name: "index_events_on_eventgroup_id", using: :btree
  add_index "events", ["eventtype_id"], name: "index_events_on_eventtype_id", using: :btree

  create_table "eventtypes", force: :cascade do |t|
    t.string   "eventtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "eventgroups"
  add_foreign_key "events", "eventtypes"
end
