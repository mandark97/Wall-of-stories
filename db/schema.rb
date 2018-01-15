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

ActiveRecord::Schema.define(version: 20180115194243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.bigint "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["story_id"], name: "index_comments_on_story_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "friend_connections", force: :cascade do |t|
    t.integer "status"
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friend_connections_on_friend_id"
    t.index ["user_id", "friend_id"], name: "index_friend_connections_on_user_id_and_friend_id", unique: true
    t.index ["user_id"], name: "index_friend_connections_on_user_id"
  end

  create_table "stories", force: :cascade do |t|
    t.text "text"
    t.string "photo"
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type"
    t.index ["album_id"], name: "index_stories_on_album_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.text "description"
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.boolean "private"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "albums", "users"
  add_foreign_key "friend_connections", "users"
  add_foreign_key "friend_connections", "users", column: "friend_id"
  add_foreign_key "stories", "albums"
  add_foreign_key "user_profiles", "users"
end
