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

ActiveRecord::Schema[8.1].define(version: 2026_07_17_200450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.string "district"
    t.string "number"
    t.uuid "profile_id", null: false
    t.string "state"
    t.string "street"
    t.datetime "updated_at", null: false
    t.string "zip_code"
    t.index ["profile_id"], name: "index_addresses_on_profile_id"
  end

  create_table "certifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "issue_date"
    t.string "issuer"
    t.string "name"
    t.uuid "profile_id", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_certifications_on_profile_id"
  end

  create_table "educations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "course"
    t.datetime "created_at", null: false
    t.string "degree"
    t.date "end_date"
    t.string "institution"
    t.uuid "profile_id", null: false
    t.date "start_date"
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_educations_on_profile_id"
  end

  create_table "experiences", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "company"
    t.datetime "created_at", null: false
    t.text "description"
    t.date "end_date"
    t.string "position"
    t.uuid "profile_id", null: false
    t.date "start_date"
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_experiences_on_profile_id"
  end

  create_table "languages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "level"
    t.string "name"
    t.uuid "profile_id", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_languages_on_profile_id"
  end

  create_table "profiles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "bio"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.string "full_name"
    t.string "phone"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "username"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "resumes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "objective"
    t.uuid "profile_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_resumes_on_profile_id"
  end

  create_table "skills", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "level"
    t.string "name"
    t.uuid "profile_id", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_skills_on_profile_id"
  end

  create_table "social_links", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "platform"
    t.uuid "profile_id", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_social_links_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "profiles"
  add_foreign_key "certifications", "profiles"
  add_foreign_key "educations", "profiles"
  add_foreign_key "experiences", "profiles"
  add_foreign_key "languages", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "resumes", "profiles"
  add_foreign_key "skills", "profiles"
  add_foreign_key "social_links", "profiles"
end
