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

ActiveRecord::Schema.define(version: 2022_02_14_051030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name", null: false
    t.integer "grade", null: false
    t.integer "gender", default: 0, null: false
    t.integer "birthplace_code"
    t.integer "living_place_code"
    t.date "date_of_birth"
    t.integer "blood_type", default: 0, null: false
    t.integer "siblings_relation", default: 0, null: false
    t.text "hobby", null: false
    t.string "times_name"
    t.integer "team_dev_will", default: 0, null: false
    t.string "twitter_account"
    t.text "self_introduce", null: false
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "github_name"
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remote_avatar_url"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
