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

ActiveRecord::Schema.define(version: 2021_03_27_001417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "friend_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "duration"
    t.string "api_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "poster_path"
  end

  create_table "parties", force: :cascade do |t|
    t.bigint "movie_id"
    t.integer "duration"
    t.bigint "host_id"
    t.date "party_date"
    t.time "party_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_parties_on_host_id"
    t.index ["movie_id"], name: "index_parties_on_movie_id"
  end

  create_table "party_viewers", force: :cascade do |t|
    t.bigint "party_id"
    t.bigint "viewer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_party_viewers_on_party_id"
    t.index ["viewer_id"], name: "index_party_viewers_on_viewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "parties", "movies"
  add_foreign_key "parties", "users", column: "host_id"
  add_foreign_key "party_viewers", "parties"
  add_foreign_key "party_viewers", "users", column: "viewer_id"
end
