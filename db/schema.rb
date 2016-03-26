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

ActiveRecord::Schema.define(version: 20160326085620) do

  create_table "agents", force: :cascade do |t|
    t.string   "code",            limit: 255
    t.integer  "province_id",     limit: 4
    t.integer  "city_id",         limit: 4
    t.integer  "district_id",     limit: 4
    t.string   "address",         limit: 255
    t.string   "name",            limit: 255
    t.string   "principal",       limit: 255
    t.string   "mobile",          limit: 255
    t.string   "e_account",       limit: 255
    t.string   "fax",             limit: 255
    t.string   "email",           limit: 255
    t.string   "wechar",          limit: 255
    t.string   "logistics",       limit: 255
    t.integer  "order_condition", limit: 4
    t.integer  "send_condition",  limit: 4
    t.string   "pay_cycle",       limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "agents", ["name"], name: "index_agents_on_name", using: :btree

  create_table "application_funds", force: :cascade do |t|
    t.integer  "fund_type",  limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "assets", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.decimal  "total",                    precision: 8, scale: 2
    t.decimal  "remain_value",             precision: 8, scale: 2
    t.datetime "buy_date"
    t.string   "note",         limit: 255
    t.integer  "number",       limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

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

  create_table "flow_bills", force: :cascade do |t|
    t.datetime "bill_date"
    t.string   "customer",            limit: 255
    t.decimal  "total",                           precision: 8, scale: 2
    t.string   "account",             limit: 255
    t.string   "note",                limit: 255
    t.string   "server_code",         limit: 255
    t.string   "order_code",          limit: 255
    t.string   "bill_code",           limit: 255
    t.integer  "operator",            limit: 4
    t.datetime "operate_date"
    t.integer  "check_status",        limit: 4
    t.datetime "check_date"
    t.integer  "application_fund_id", limit: 4
    t.string   "checker",             limit: 255
    t.integer  "bill_type",           limit: 4
    t.string   "purchase_code",       limit: 255
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "flow_bills", ["application_fund_id"], name: "index_flow_bills_on_application_fund_id", using: :btree

  create_table "item_storages", force: :cascade do |t|
    t.datetime "storage_date"
    t.string   "receiver",     limit: 255
    t.integer  "purchase_id",  limit: 4
    t.integer  "item_id",      limit: 4
    t.string   "item_type",    limit: 255
    t.string   "brand",        limit: 255
    t.integer  "number",       limit: 4
    t.integer  "supplier_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "item_storages", ["purchase_id"], name: "index_item_storages_on_purchase_id", using: :btree
  add_index "item_storages", ["supplier_id"], name: "index_item_storages_on_supplier_id", using: :btree

  create_table "material_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "material_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "materials", force: :cascade do |t|
    t.integer  "material_category_id", limit: 4
    t.integer  "material_type_id",     limit: 4
    t.integer  "number",               limit: 4
    t.decimal  "price",                            precision: 9, scale: 6
    t.string   "code",                 limit: 255
    t.string   "unit",                 limit: 255
    t.integer  "supplier_id",          limit: 4
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "applied_number",       limit: 4
  end

  add_index "materials", ["material_category_id"], name: "index_materials_on_material_category_id", using: :btree
  add_index "materials", ["material_type_id"], name: "index_materials_on_material_type_id", using: :btree
  add_index "materials", ["supplier_id"], name: "index_materials_on_supplier_id", using: :btree

  create_table "mix_tasks", force: :cascade do |t|
    t.integer  "number",       limit: 4
    t.decimal  "availability",             precision: 8, scale: 2
    t.string   "file_path",    limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "month_salaries", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.string   "name",                 limit: 255
    t.decimal  "total",                            precision: 8, scale: 2
    t.decimal  "extra",                            precision: 8, scale: 2
    t.decimal  "add",                              precision: 8, scale: 2
    t.decimal  "cut",                              precision: 8, scale: 2
    t.decimal  "bonus",                            precision: 8, scale: 2
    t.decimal  "old_age_insurance",                precision: 8, scale: 2
    t.decimal  "medicare_insurance",               precision: 8, scale: 2
    t.decimal  "unemployed_insurance",             precision: 8, scale: 2
    t.decimal  "house_fund",                       precision: 8, scale: 2
    t.decimal  "pre_tax",                          precision: 8, scale: 2
    t.decimal  "income_tax",                       precision: 8, scale: 2
    t.decimal  "actual",                           precision: 8, scale: 2
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "month_salaries", ["user_id"], name: "index_month_salaries_on_user_id", using: :btree

  create_table "offers", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.string   "item_name",  limit: 255
    t.integer  "item_id",    limit: 4
    t.string   "item_type",  limit: 255
    t.decimal  "number",                 precision: 8, scale: 2
    t.decimal  "price",                  precision: 8, scale: 2
    t.decimal  "total",                  precision: 8, scale: 2
    t.string   "category",   limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "offers", ["item_id"], name: "index_offers_on_item_id", using: :btree
  add_index "offers", ["order_id"], name: "index_offers_on_order_id", using: :btree
  add_index "offers", ["user_id"], name: "index_offers_on_user_id", using: :btree

  create_table "order_bills", force: :cascade do |t|
    t.integer  "order_id",      limit: 4
    t.decimal  "total",                     precision: 8, scale: 2
    t.decimal  "paid",                      precision: 8, scale: 2
    t.decimal  "left",                      precision: 8, scale: 2
    t.datetime "pay_date"
    t.string   "pay_account",   limit: 255
    t.integer  "directive",     limit: 4
    t.integer  "user_id",       limit: 4
    t.date     "delivery_date"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "order_bills", ["order_id"], name: "index_order_bills_on_order_id", using: :btree
  add_index "order_bills", ["user_id"], name: "index_order_bills_on_user_id", using: :btree

  create_table "order_parts", force: :cascade do |t|
    t.integer  "order_id",        limit: 4
    t.integer  "part_id",         limit: 4
    t.integer  "number",          limit: 4
    t.string   "note",            limit: 255
    t.integer  "produce_task_id", limit: 4
    t.integer  "state",           limit: 4,   default: 0
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "order_parts", ["order_id"], name: "index_order_parts_on_order_id", using: :btree
  add_index "order_parts", ["part_id"], name: "index_order_parts_on_part_id", using: :btree
  add_index "order_parts", ["produce_task_id"], name: "index_order_parts_on_produce_task_id", using: :btree

  create_table "order_units", force: :cascade do |t|
    t.integer  "order_id",         limit: 4
    t.string   "code",             limit: 255
    t.string   "unit_name",        limit: 255
    t.string   "name",             limit: 255
    t.integer  "lenght",           limit: 4
    t.integer  "width",            limit: 4
    t.integer  "thick",            limit: 4
    t.integer  "number",           limit: 4
    t.string   "size",             limit: 255
    t.string   "note",             limit: 255
    t.string   "color",            limit: 255
    t.string   "edge",             limit: 255
    t.string   "texture",          limit: 255
    t.string   "terminal",         limit: 255
    t.integer  "out_edge_thick",   limit: 4
    t.integer  "in_edge_thick",    limit: 4
    t.string   "back_texture",     limit: 255
    t.string   "door_type",        limit: 255
    t.string   "door_mould",       limit: 255
    t.string   "door_handle_type", limit: 255
    t.string   "door_edge_type",   limit: 255
    t.integer  "door_edge_thick",  limit: 4
    t.integer  "produce_task_id",  limit: 4
    t.integer  "state",            limit: 4,   default: 0
    t.integer  "user_id",          limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "order_units", ["order_id"], name: "index_order_units_on_order_id", using: :btree
  add_index "order_units", ["produce_task_id"], name: "index_order_units_on_produce_task_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "order_code",    limit: 255
    t.integer  "product_id",    limit: 4
    t.string   "customer_code", limit: 255
    t.integer  "agent_id",      limit: 4
    t.string   "server_code",   limit: 255
    t.integer  "type",          limit: 4
    t.string   "patch_origin",  limit: 255
    t.integer  "work_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "employee",      limit: 255
  end

  add_index "orders", ["work_id"], name: "index_orders_on_work_id", using: :btree

  create_table "out_storages", force: :cascade do |t|
    t.datetime "out_date"
    t.integer  "department_id",   limit: 4
    t.string   "out_user",        limit: 255
    t.integer  "produce_task_id", limit: 4
    t.integer  "item_id",         limit: 4
    t.string   "item_type",       limit: 255
    t.string   "number",          limit: 255
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "out_storages", ["department_id"], name: "index_out_storages_on_department_id", using: :btree
  add_index "out_storages", ["produce_task_id"], name: "index_out_storages_on_produce_task_id", using: :btree
  add_index "out_storages", ["user_id"], name: "index_out_storages_on_user_id", using: :btree

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
    t.integer  "applied_number",   limit: 4
  end

  add_index "parts", ["part_category_id"], name: "index_parts_on_part_category_id", using: :btree
  add_index "parts", ["supplier_id"], name: "index_parts_on_supplier_id", using: :btree

  create_table "produce_tasks", force: :cascade do |t|
    t.integer  "order_id",     limit: 4
    t.integer  "item_id",      limit: 4
    t.string   "item_type",    limit: 255
    t.string   "sequence",     limit: 255
    t.decimal  "area",                     precision: 9, scale: 6
    t.integer  "mix_task_id",  limit: 4
    t.integer  "mix_status",   limit: 4
    t.decimal  "availability",             precision: 8, scale: 2
    t.integer  "work_id",      limit: 4
    t.integer  "state",        limit: 4
    t.integer  "number",       limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "produce_tasks", ["item_id"], name: "index_produce_tasks_on_item_id", using: :btree
  add_index "produce_tasks", ["mix_task_id"], name: "index_produce_tasks_on_mix_task_id", using: :btree
  add_index "produce_tasks", ["order_id"], name: "index_produce_tasks_on_order_id", using: :btree

  create_table "produces", force: :cascade do |t|
    t.integer  "produce_task_id", limit: 4
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "work_id",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "produces", ["produce_task_id"], name: "index_produces_on_produce_task_id", using: :btree

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

  create_table "purchases", force: :cascade do |t|
    t.string   "original_code",  limit: 255
    t.integer  "item_id",        limit: 4
    t.string   "item_type",      limit: 255
    t.string   "number",         limit: 255
    t.string   "unit",           limit: 255
    t.string   "note",           limit: 255
    t.integer  "way",            limit: 4
    t.integer  "arrival_number", limit: 4
    t.decimal  "price",                      precision: 8, scale: 2
    t.decimal  "payable",                    precision: 8, scale: 2
    t.decimal  "actual_pay",                 precision: 8, scale: 2
    t.decimal  "discount",                   precision: 8, scale: 2
    t.integer  "pay_type",       limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "user_id",        limit: 4
    t.string   "checker",        limit: 255
    t.integer  "check_status",   limit: 4
    t.datetime "check_date"
    t.integer  "supplier_id",    limit: 4
  end

  add_index "purchases", ["item_id"], name: "index_purchases_on_item_id", using: :btree
  add_index "purchases", ["supplier_id"], name: "index_purchases_on_supplier_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

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

  create_table "staffs", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.string   "name",                 limit: 255
    t.integer  "department_id",        limit: 4
    t.string   "id_card",              limit: 255
    t.decimal  "base_salary",                      precision: 8, scale: 2
    t.decimal  "old_age_insurance",                precision: 8, scale: 2
    t.decimal  "medicare_insurance",               precision: 8, scale: 2
    t.decimal  "unemployed_insurance",             precision: 8, scale: 2
    t.decimal  "house_fund",                       precision: 8, scale: 2
    t.integer  "status",               limit: 4
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "staffs", ["department_id"], name: "index_staffs_on_department_id", using: :btree
  add_index "staffs", ["user_id"], name: "index_staffs_on_user_id", using: :btree

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

  create_table "works", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "department_id", limit: 4
    t.string   "symbol_name",   limit: 255
    t.integer  "sequence",      limit: 4
    t.integer  "cycle",         limit: 4
    t.string   "remark",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "cities", "provinces"
  add_foreign_key "districts", "cities"
  add_foreign_key "flow_bills", "application_funds"
  add_foreign_key "item_storages", "purchases"
  add_foreign_key "item_storages", "suppliers"
  add_foreign_key "materials", "material_categories"
  add_foreign_key "materials", "material_types"
  add_foreign_key "materials", "suppliers"
  add_foreign_key "month_salaries", "users"
  add_foreign_key "offers", "orders"
  add_foreign_key "offers", "users"
  add_foreign_key "order_bills", "orders"
  add_foreign_key "order_bills", "users"
  add_foreign_key "order_parts", "orders"
  add_foreign_key "order_parts", "parts"
  add_foreign_key "order_parts", "produce_tasks"
  add_foreign_key "order_units", "orders"
  add_foreign_key "order_units", "produce_tasks"
  add_foreign_key "orders", "works"
  add_foreign_key "out_storages", "departments"
  add_foreign_key "out_storages", "produce_tasks"
  add_foreign_key "out_storages", "users"
  add_foreign_key "parts", "part_categories"
  add_foreign_key "produce_tasks", "mix_tasks"
  add_foreign_key "produce_tasks", "orders"
  add_foreign_key "produces", "produce_tasks"
  add_foreign_key "purchases", "suppliers"
  add_foreign_key "purchases", "users"
  add_foreign_key "staffs", "departments"
  add_foreign_key "staffs", "users"
end
