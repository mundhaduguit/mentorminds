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

ActiveRecord::Schema.define(version: 20150717121157) do

  create_table "challenges", force: :cascade do |t|
    t.text     "question",         limit: 65535
    t.text     "answer",           limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "industry_id",      limit: 4
    t.integer  "pre_challenge_id", limit: 4
    t.integer  "first_date",       limit: 4
    t.integer  "second_date",      limit: 4
  end

  create_table "industries", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "description",          limit: 255
    t.integer  "industry_category_id", limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",      limit: 255
    t.string   "image_content_type",   limit: 255
    t.integer  "image_file_size",      limit: 4
    t.datetime "image_updated_at"
  end

  create_table "industry_categories", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "description",        limit: 255
    t.integer  "parent_id",          limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "imageable_id",       limit: 255
    t.string   "imageable_type",     limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "pre_challenge_events", force: :cascade do |t|
    t.integer  "pre_challenge_id", limit: 4
    t.string   "state",            limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "pre_challenge_events", ["pre_challenge_id"], name: "index_pre_challenge_events_on_pre_challenge_id", using: :btree

  create_table "pre_challenges", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "industry_id", limit: 4
    t.integer  "first_date",  limit: 4
    t.integer  "second_date", limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "royce_connector", force: :cascade do |t|
    t.integer  "roleable_id",   limit: 4,   null: false
    t.string   "roleable_type", limit: 255, null: false
    t.integer  "role_id",       limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "royce_connector", ["role_id"], name: "index_royce_connector_on_role_id", using: :btree
  add_index "royce_connector", ["roleable_id", "roleable_type"], name: "index_royce_connector_on_roleable_id_and_roleable_type", using: :btree

  create_table "royce_role", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "royce_role", ["name"], name: "index_royce_role_on_name", using: :btree

  create_table "user_accessed_industries", force: :cascade do |t|
    t.integer  "industry_category_id", limit: 4
    t.integer  "user_id",              limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "user_answers", force: :cascade do |t|
    t.text     "answer",            limit: 65535
    t.integer  "user_id",           limit: 4
    t.integer  "user_challenge_id", limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "status",            limit: 255
    t.decimal  "marks",                           precision: 10
    t.integer  "industry_id",       limit: 4
  end

  add_index "user_answers", ["user_challenge_id"], name: "index_user_answers_on_user_challenge_id", using: :btree
  add_index "user_answers", ["user_id"], name: "index_user_answers_on_user_id", using: :btree

  create_table "user_challenge_events", force: :cascade do |t|
    t.integer  "user_challenge_id", limit: 4
    t.string   "state",             limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "user_challenge_events", ["user_challenge_id"], name: "index_user_challenge_events_on_user_challenge_id", using: :btree

  create_table "user_challenges", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "challenge_id", limit: 4
    t.string   "locked",       limit: 255
    t.integer  "marks",        limit: 4
    t.text     "answer",       limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "user_pre_challenges", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "pre_challenge_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "score",            limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "user_name",              limit: 255
    t.string   "collage",                limit: 255
    t.string   "course",                 limit: 255
    t.date     "date_of_birth"
    t.string   "gender",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",        limit: 255
    t.string   "image_content_type",     limit: 255
    t.integer  "image_file_size",        limit: 4
    t.datetime "image_updated_at"
    t.boolean  "flag",                   limit: 1,   default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "user_answers", "user_challenges"
end
