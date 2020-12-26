# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_26_024208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "ticket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "memo_id"
    t.bigint "project_id"
    t.bigint "owner_id"
    t.index ["memo_id"], name: "index_events_on_memo_id"
    t.index ["owner_id"], name: "index_events_on_owner_id"
    t.index ["project_id"], name: "index_events_on_project_id"
    t.index ["ticket_id"], name: "index_events_on_ticket_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "memos", force: :cascade do |t|
    t.bigint "ticket_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ticket_id"], name: "index_memos_on_ticket_id"
    t.index ["user_id"], name: "index_memos_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
  end

  create_table "tickets", force: :cascade do |t|
    t.text "description"
    t.string "status", default: "open"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "creator_id"
    t.bigint "owner_id"
    t.string "priority", default: "3"
    t.string "category"
    t.index ["creator_id"], name: "index_tickets_on_creator_id"
    t.index ["owner_id"], name: "index_tickets_on_owner_id"
    t.index ["project_id"], name: "index_tickets_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "employee_number"
    t.boolean "active", default: true
    t.boolean "supervisor"
    t.string "username", default: "first_name_last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "memos"
  add_foreign_key "events", "projects"
  add_foreign_key "events", "tickets"
  add_foreign_key "events", "users"
  add_foreign_key "events", "users", column: "owner_id"
  add_foreign_key "memos", "tickets"
  add_foreign_key "memos", "users"
  add_foreign_key "tickets", "projects"
  add_foreign_key "tickets", "users", column: "creator_id"
  add_foreign_key "tickets", "users", column: "owner_id"
end
