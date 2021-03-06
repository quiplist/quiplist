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

ActiveRecord::Schema.define(version: 2020_12_30_110440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.bigint "guest_list_id"
    t.string "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guest_list_id"], name: "index_answers_on_guest_list_id"
    t.index ["questionnaire_id"], name: "index_answers_on_questionnaire_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_code"
    t.string "title"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "event_type", default: 0
    t.integer "stream_type"
    t.string "stream_key"
    t.string "stream_video"
    t.string "brochure"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guest_lists", force: :cascade do |t|
    t.bigint "approver_id"
    t.bigint "user_id"
    t.bigint "event_id"
    t.integer "status", default: 0
    t.integer "raffle_number"
    t.integer "raffle_status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["approver_id"], name: "index_guest_lists_on_approver_id"
    t.index ["event_id"], name: "index_guest_lists_on_event_id"
    t.index ["user_id"], name: "index_guest_lists_on_user_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.bigint "event_id"
    t.integer "questionnaire_type", default: 0
    t.string "question"
    t.string "answer", array: true
    t.string "choices", array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_questionnaires_on_event_id"
  end

  create_table "raffles", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "guest_list_id"
    t.integer "raffle_type", default: 0
    t.string "prize"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_raffles_on_event_id"
    t.index ["guest_list_id"], name: "index_raffles_on_guest_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "full_name"
    t.date "birthdate"
    t.string "contact_number"
    t.integer "member_type", default: 0
    t.string "member_id"
    t.string "affiliation"
    t.integer "role", default: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
