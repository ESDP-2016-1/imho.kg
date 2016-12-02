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

ActiveRecord::Schema.define(version: 20161201163327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "topcategory_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "categories", ["topcategory_id"], name: "index_categories_on_topcategory_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "address"
    t.string   "phones"
    t.string   "email"
    t.string   "website"
    t.string   "working_hours"
    t.string   "registration_year"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "city_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "category_id"
  end

  add_index "companies", ["category_id"], name: "index_companies_on_category_id", using: :btree
  add_index "companies", ["city_id"], name: "index_companies_on_city_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "ucomment_id"
  end

  add_index "favorites", ["ucomment_id"], name: "index_favorites_on_ucomment_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "genders", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "company_id"
  end

  add_index "ratings", ["company_id"], name: "index_ratings_on_company_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ucomments", force: :cascade do |t|
    t.text     "body"
    t.boolean  "anonymous"
    t.boolean  "positive"
    t.integer  "rate"
    t.integer  "topucomment_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "image_id"
    t.string   "title"
    t.boolean  "deleted",        default: false
  end

  add_index "ucomments", ["company_id"], name: "index_ucomments_on_company_id", using: :btree
  add_index "ucomments", ["image_id"], name: "index_ucomments_on_image_id", using: :btree
  add_index "ucomments", ["topucomment_id"], name: "index_ucomments_on_topucomment_id", using: :btree
  add_index "ucomments", ["user_id"], name: "index_ucomments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.date     "dob"
    t.integer  "gender_id"
    t.integer  "city_id"
    t.string   "fullname"
    t.boolean  "active",                 default: false
    t.integer  "role_id",                default: 1
    t.string   "facebook_uid"
    t.string   "vkontakte_uid"
    t.string   "odnoklassniki_uid"
    t.string   "twitter_uid"
    t.string   "google_uid"
    t.string   "mailru_uid"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["gender_id"], name: "index_users_on_gender_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.boolean  "is_liked"
    t.integer  "user_id"
    t.integer  "ucomment_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "votes", ["ucomment_id"], name: "index_votes_on_ucomment_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "categories", "categories", column: "topcategory_id"
  add_foreign_key "companies", "categories"
  add_foreign_key "companies", "cities"
  add_foreign_key "favorites", "ucomments"
  add_foreign_key "favorites", "users"
  add_foreign_key "ratings", "companies"
  add_foreign_key "ratings", "users"
  add_foreign_key "ucomments", "companies"
  add_foreign_key "ucomments", "images"
  add_foreign_key "ucomments", "ucomments", column: "topucomment_id"
  add_foreign_key "ucomments", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "genders"
  add_foreign_key "users", "roles"
  add_foreign_key "votes", "ucomments"
  add_foreign_key "votes", "users"
end
