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

ActiveRecord::Schema.define(version: 20160313124800) do

  create_table "agents", force: :cascade do |t|
    t.string   "code",         limit: 255
    t.integer  "province_id",  limit: 4
    t.integer  "city_id",      limit: 4
    t.integer  "district_id",  limit: 4
    t.string   "address",      limit: 255
    t.string   "name",         limit: 255
    t.string   "principal",    limit: 255
    t.string   "mobile",       limit: 255
    t.string   "e_account",    limit: 255
    t.string   "fax",          limit: 255
    t.string   "email",        limit: 255
    t.string   "wechar",       limit: 255
    t.string   "logistics",    limit: 255
    t.integer  "condition_id", limit: 4
    t.string   "pay_cycle",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "agents", ["city_id"], name: "index_agents_on_city_id", using: :btree
  add_index "agents", ["district_id"], name: "index_agents_on_district_id", using: :btree
  add_index "agents", ["name"], name: "index_agents_on_name", using: :btree
  add_index "agents", ["province_id"], name: "index_agents_on_province_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.integer "province_id", limit: 4
    t.string  "name",        limit: 255
  end

  add_index "cities", ["province_id", "name"], name: "index_cities_on_province_id_and_name", unique: true, using: :btree
  add_index "cities", ["province_id"], name: "index_cities_on_province_id", using: :btree

  create_table "conditions", force: :cascade do |t|
    t.string   "types",      limit: 255
    t.string   "name",       limit: 255
    t.string   "remark",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255,   null: false
    t.integer  "manager_id", limit: 4
    t.integer  "number",     limit: 4
    t.text     "desc",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "departments", ["manager_id"], name: "index_departments_on_manager_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.integer "city_id", limit: 4
    t.string  "name",    limit: 255
  end

  add_index "districts", ["city_id", "name"], name: "index_districts_on_city_id_and_name", unique: true, using: :btree
  add_index "districts", ["city_id"], name: "index_districts_on_city_id", using: :btree

  create_table "materials", force: :cascade do |t|
    t.string   "origin_material", limit: 255
    t.string   "type_no",         limit: 255
    t.string   "brand",           limit: 255
    t.integer  "supply_id",       limit: 4
    t.string   "standard_type",   limit: 255
    t.string   "standard_no",     limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_code",    limit: 255
    t.integer  "product_id",    limit: 4
    t.string   "customer_code", limit: 255
    t.integer  "agent_id",      limit: 4
    t.string   "server_code",   limit: 255
    t.string   "type",          limit: 255
    t.string   "patch_origin",  limit: 255
    t.string   "status",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "employee",      limit: 255
  end

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

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.string   "remark",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name", limit: 255
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

  create_table "suppliers", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "mobile",       limit: 255
    t.string   "bank_account", limit: 255
    t.string   "address",      limit: 255
    t.string   "note",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "code",             limit: 255
    t.string   "name",             limit: 255
    t.integer  "lenght",           limit: 4
    t.integer  "width",            limit: 4
    t.integer  "thick",            limit: 4
    t.string   "ramark",           limit: 255
    t.string   "order_code",       limit: 255
    t.string   "color",            limit: 255
    t.integer  "out_edge_thick",   limit: 4
    t.integer  "in_edge_thick",    limit: 4
    t.string   "back_texture",     limit: 255
    t.string   "back_color",       limit: 255
    t.string   "door_type",        limit: 255
    t.string   "door_color",       limit: 255
    t.string   "door_mould",       limit: 255
    t.string   "door_handle_type", limit: 255
    t.string   "door_edge_type",   limit: 255
    t.integer  "door_edge_thick",  limit: 4
    t.string   "customer_code",    limit: 255
    t.string   "job_code",         limit: 255
    t.string   "pack_code",        limit: 255
    t.string   "next_job",         limit: 255
    t.string   "employee_code",    limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
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

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "works", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "department_id", limit: 4
    t.integer  "sequence",      limit: 4
    t.integer  "cycle",         limit: 4
    t.string   "remark",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "agents", "cities"
  add_foreign_key "agents", "districts"
  add_foreign_key "agents", "provinces"
  add_foreign_key "cities", "provinces"
  add_foreign_key "districts", "cities"
  add_foreign_key "parts", "part_categories"
end
