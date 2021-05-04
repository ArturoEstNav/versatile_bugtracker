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

ActiveRecord::Schema.define(version: 2021_05_04_184214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "eventable_type"
    t.bigint "eventable_id"
    t.bigint "user_id"
    t.string "description"
    t.string "link", default: ""
    t.index ["eventable_type", "eventable_id"], name: "index_events_on_eventable_type_and_eventable_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "memos", force: :cascade do |t|
    t.bigint "ticket_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["ticket_id"], name: "index_memos_on_ticket_id"
    t.index ["user_id"], name: "index_memos_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
    t.text "description"
  end

  create_table "tickets", force: :cascade do |t|
    t.text "description"
    t.string "status", default: "open"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "priority", default: "necessary"
    t.string "category"
    t.string "title"
    t.bigint "user_id"
    t.float "working_time", default: 0.0
    t.boolean "active", default: false
    t.integer "start_time", default: 0
    t.integer "end_time", default: 0
    t.index ["project_id"], name: "index_tickets_on_project_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "link", default: ""
    t.index ["user_id"], name: "index_user_events_on_user_id"
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
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "working_tickets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ticket_id", null: false
    t.float "worked_time", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "start_time", default: 0
    t.integer "end_time", default: 0
    t.index ["ticket_id"], name: "index_working_tickets_on_ticket_id"
    t.index ["user_id"], name: "index_working_tickets_on_user_id"
  end

  add_foreign_key "memos", "tickets"
  add_foreign_key "tickets", "projects"
  add_foreign_key "user_events", "users"
  add_foreign_key "working_tickets", "tickets"
  add_foreign_key "working_tickets", "users"
end
