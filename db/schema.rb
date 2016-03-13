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

ActiveRecord::Schema.define(version: 20160313022946) do

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255,   null: false
    t.integer  "manager_id", limit: 4
    t.integer  "number",     limit: 4
    t.text     "desc",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "departments", ["manager_id"], name: "index_departments_on_manager_id", using: :btree

  create_table "part_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "note",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "parts", force: :cascade do |t|
    t.integer  "part_category_id", limit: 4
    t.string   "name",             limit: 255
    t.decimal  "price",                        precision: 8, scale: 2
    t.integer  "number",           limit: 4
    t.string   "brand",            limit: 255
    t.integer  "supplier_id",      limit: 4
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "parts", ["part_category_id"], name: "index_parts_on_part_category_id", using: :btree
  add_index "parts", ["supplier_id"], name: "index_parts_on_supplier_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 32, null: false
    t.string   "key",        limit: 32, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "roles", ["key"], name: "index_roles_on_key", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "roles_permissions", force: :cascade do |t|
    t.integer "role_id", limit: 4
    t.string  "klass",   limit: 255, null: false
    t.string  "actions", limit: 255, null: false
  end

  add_index "roles_permissions", ["role_id"], name: "index_roles_permissions_on_role_id", using: :btree

  create_table "roles_users", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "suppliers", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "mobile",       limit: 255
    t.string   "bank_account", limit: 255
    t.string   "address",      limit: 255
    t.string   "note",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.integer  "gender",                 limit: 4
    t.integer  "status",                 limit: 4
    t.integer  "department_id",          limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "parts", "part_categories"
end
