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

ActiveRecord::Schema.define(version: 2020_03_11_030826) do

  create_table "animal_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animal_permits", force: :cascade do |t|
    t.integer "permitter_id"  #誰かを許可している人
    t.integer "permitted_id"  #誰かが許可した人
    t.boolean "is_permit", default: false  #閲覧許可しているかどうか（false 承認待ち、true 承認）
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_permit"], name: "index_animal_permits_on_is_permit"
    t.index ["permitted_id"], name: "index_animal_permits_on_permitted_id"
    t.index ["permitter_id", "permitted_id"], name: "index_animal_permits_on_permitter_id_and_permitted_id", unique: true
    t.index ["permitter_id"], name: "index_animal_permits_on_permitter_id"
  end

  create_table "animals", force: :cascade do |t|
    t.integer "user_id"
    t.string "animal_image_id"
    t.string "name"
    t.text "food"
    t.text "toilet"
    t.text "water"
    t.text "hospital"
    t.text "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birth"
  end

  create_table "blog_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_genre_relations", force: :cascade do |t|
    t.integer "blog_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "blog_image_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "introduction"
    t.string "icon_id"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
