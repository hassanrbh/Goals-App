# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_11_113417) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cheers", force: :cascade do |t|
    t.integer "giver_id", null: false
    t.integer "intention_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["giver_id"], name: "index_cheers_on_giver_id"
    t.index ["intention_id", "giver_id"], name: "index_cheers_on_intention_id_and_giver_id", unique: true
  end

  create_table "goal_comments", force: :cascade do |t|
    t.text "comment", null: false
    t.bigint "intention_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intention_id"], name: "index_goal_comments_on_intention_id"
  end

  create_table "intentions", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.string "status", default: "public", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "completed", default: "Ongoing"
    t.index ["user_id"], name: "index_intentions_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "likeable_type"
    t.bigint "likeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable"
    t.index ["user_id", "likeable_id", "likeable_type"], name: "index_likes_on_user_id_and_likeable_id_and_likeable_type", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "user_comments", force: :cascade do |t|
    t.text "comment", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_comments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "username", null: false
    t.integer "birth_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "session_token", null: false
  end

end
