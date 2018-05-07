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

ActiveRecord::Schema.define(version: 17) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abletoteaches", force: :cascade do |t|
    t.bigint "instructor_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_abletoteaches_on_course_id"
    t.index ["instructor_id"], name: "index_abletoteaches_on_instructor_id"
  end

  create_table "certagencies", force: :cascade do |t|
    t.string "cert_agency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.boolean "is_certification_course"
    t.boolean "is_speciality_course"
    t.boolean "is_introductory_course"
    t.bigint "certagency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certagency_id"], name: "index_courses_on_certagency_id"
  end

  create_table "divers", force: :cascade do |t|
    t.bigint "certagency_id"
    t.integer "total_dives"
    t.bigint "user_id"
    t.bigint "qualification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certagency_id"], name: "index_divers_on_certagency_id"
    t.index ["qualification_id"], name: "index_divers_on_qualification_id"
    t.index ["user_id"], name: "index_divers_on_user_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.bigint "certagency_id"
    t.integer "total_dives"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certagency_id"], name: "index_instructors_on_certagency_id"
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "meetup_comments", force: :cascade do |t|
    t.bigint "meetup_id"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_meetup_comments_on_comment_id"
    t.index ["meetup_id"], name: "index_meetup_comments_on_meetup_id"
  end

  create_table "meetupmembers", force: :cascade do |t|
    t.bigint "meetup_id"
    t.bigint "user_id"
    t.boolean "is_owner"
    t.boolean "can_edit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meetup_id"], name: "index_meetupmembers_on_meetup_id"
    t.index ["user_id"], name: "index_meetupmembers_on_user_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_commercial_trip"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.boolean "is_boat_required"
    t.decimal "price"
    t.integer "member_limit"
    t.datetime "date"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "qualification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "skippers", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "has_boat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_skippers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_disabled"
    t.string "image"
    t.string "image_cl_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "abletoteaches", "courses"
  add_foreign_key "abletoteaches", "instructors"
  add_foreign_key "comments", "users"
  add_foreign_key "courses", "certagencies"
  add_foreign_key "divers", "certagencies"
  add_foreign_key "divers", "qualifications"
  add_foreign_key "divers", "users"
  add_foreign_key "instructors", "certagencies"
  add_foreign_key "instructors", "users"
  add_foreign_key "meetup_comments", "comments"
  add_foreign_key "meetup_comments", "meetups"
  add_foreign_key "meetupmembers", "meetups"
  add_foreign_key "meetupmembers", "users"
  add_foreign_key "skippers", "users"
end
