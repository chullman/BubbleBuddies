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

ActiveRecord::Schema.define(version: 99) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "timescaledb"

  create_table "abletoteaches", force: :cascade do |t|
    t.bigint "instructor_id"
    t.bigint "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_abletoteaches_on_course_id"
    t.index ["instructor_id"], name: "index_abletoteaches_on_instructor_id"
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "certagencies", force: :cascade do |t|
    t.string "cert_agency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.boolean "is_certification_course"
    t.boolean "is_speciality_course"
    t.boolean "is_introductory_course"
    t.bigint "certagency_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["certagency_id"], name: "index_courses_on_certagency_id"
  end

  create_table "divers", force: :cascade do |t|
    t.bigint "certagency_id"
    t.integer "total_dives"
    t.bigint "user_id"
    t.bigint "qualification_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["certagency_id"], name: "index_divers_on_certagency_id"
    t.index ["qualification_id"], name: "index_divers_on_qualification_id"
    t.index ["user_id"], name: "index_divers_on_user_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.bigint "certagency_id"
    t.integer "total_dives"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["certagency_id"], name: "index_instructors_on_certagency_id"
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "meetupcomments", force: :cascade do |t|
    t.bigint "meetup_id"
    t.bigint "comment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_meetupcomments_on_comment_id"
    t.index ["meetup_id"], name: "index_meetupcomments_on_meetup_id"
  end

  create_table "meetupmembers", force: :cascade do |t|
    t.bigint "meetup_id"
    t.bigint "user_id"
    t.boolean "is_owner"
    t.boolean "can_edit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meetup_id"], name: "index_meetupmembers_on_meetup_id"
    t.index ["user_id"], name: "index_meetupmembers_on_user_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.string "name"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "meetup_type"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "qualification"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "skippers", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "has_boat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_disabled"
    t.string "image"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
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
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "users"
  add_foreign_key "courses", "certagencies"
  add_foreign_key "divers", "certagencies"
  add_foreign_key "divers", "qualifications"
  add_foreign_key "divers", "users"
  add_foreign_key "instructors", "certagencies"
  add_foreign_key "instructors", "users"
  add_foreign_key "meetupcomments", "comments"
  add_foreign_key "meetupcomments", "meetups"
  add_foreign_key "meetupmembers", "meetups"
  add_foreign_key "meetupmembers", "users"
  add_foreign_key "skippers", "users"
end
