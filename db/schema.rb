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

ActiveRecord::Schema.define(version: 20151230174135) do

  create_table "channels", force: :cascade do |t|
    t.string  "name"
    t.integer "site_id"
    t.boolean "basic",   default: false
  end

  add_index "channels", ["site_id"], name: "index_channels_on_site_id"

  create_table "sites", force: :cascade do |t|
    t.string  "name"
    t.string  "url"
    t.string  "channel_url"
    t.boolean "validates",   default: false
  end

  create_table "stories", force: :cascade do |t|
    t.string  "title"
    t.string  "url"
    t.integer "channel_id"
    t.integer "points"
  end

  add_index "stories", ["channel_id"], name: "index_stories_on_channel_id"

  create_table "user_channels", force: :cascade do |t|
    t.integer "user_id"
    t.integer "channel_id"
  end

  add_index "user_channels", ["channel_id"], name: "index_user_channels_on_channel_id"
  add_index "user_channels", ["user_id"], name: "index_user_channels_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "password_digest"
  end

end
