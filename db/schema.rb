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

ActiveRecord::Schema.define(version: 20150904123817) do

  create_table "appointment_types", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.text     "description",           limit: 65535
    t.string   "category",              limit: 255
    t.integer  "duration_time",         limit: 4,     default: 30, null: false
    t.string   "billable_item",         limit: 255
    t.string   "default_note_template", limit: 255
    t.string   "related_product",       limit: 255
    t.string   "color_code",            limit: 255
    t.text     "prefer_practi",         limit: 65535
    t.integer  "company_id",            limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.boolean  "confirm_email"
    t.boolean  "send_reminder"
  end

  add_index "appointment_types", ["company_id"], name: "index_appointment_types_on_company_id", using: :btree

  create_table "billable_items", force: :cascade do |t|
    t.string   "item_code",        limit: 255
    t.string   "name",             limit: 255
    t.integer  "price",            limit: 4
    t.boolean  "include_tax"
    t.integer  "tax",              limit: 4
    t.text     "concession_price", limit: 65535
    t.integer  "company_id",       limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "billable_items", ["company_id"], name: "index_billable_items_on_company_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "address",        limit: 65535
    t.text     "reg_info",       limit: 65535
    t.string   "web_url",        limit: 255
    t.text     "contact_info",   limit: 65535
    t.boolean  "online_booking",               default: true, null: false
    t.integer  "company_id",     limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "businesses", ["company_id"], name: "index_businesses_on_company_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "email",               limit: 255
    t.string   "password",            limit: 255
    t.string   "country",             limit: 255
    t.datetime "time_zone"
    t.string   "attendees",           limit: 255,   default: "patients",   null: false
    t.boolean  "note_letter",                       default: false,        null: false
    t.boolean  "show_finance",                      default: false,        null: false
    t.boolean  "show_attachment",                   default: false,        null: false
    t.string   "communication_email", limit: 255
    t.text     "calendar_setting",    limit: 65535
    t.boolean  "multi_appointment",                 default: false,        null: false
    t.boolean  "show_time_indicator",               default: true,         null: false
    t.string   "patient_name_by",     limit: 255,   default: "First Name", null: false
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "company_name",        limit: 255
  end

  create_table "concessions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "company_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "concessions", ["company_id"], name: "index_concessions_on_company_id", using: :btree

  create_table "online_bookings", force: :cascade do |t|
    t.boolean  "allow_online"
    t.boolean  "show_address"
    t.text     "ga_code",                 limit: 65535
    t.integer  "min_appointment",         limit: 4
    t.integer  "advance_booking_time",    limit: 4
    t.integer  "min_cancel_appoint_time", limit: 4
    t.string   "notify_by",               limit: 255
    t.boolean  "show_price"
    t.boolean  "hide_end_time"
    t.boolean  "req_patient_addr"
    t.text     "time_sel_info",           limit: 65535
    t.text     "terms",                   limit: 65535
    t.integer  "company_id",              limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "online_bookings", ["company_id"], name: "index_online_bookings_on_company_id", using: :btree

  create_table "payment_settings", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "company_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "payment_settings", ["company_id"], name: "index_payment_settings_on_company_id", using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "no_doctors",      limit: 4
    t.integer  "monthly_price",   limit: 4
    t.boolean  "is_selected"
    t.integer  "subscription_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "plans", ["subscription_id"], name: "index_plans_on_subscription_id", using: :btree

  create_table "practi_avails", force: :cascade do |t|
    t.string   "day_name",       limit: 255
    t.integer  "start_hr",       limit: 4
    t.integer  "start_min",      limit: 4
    t.integer  "end_hr",         limit: 4
    t.integer  "end_min",        limit: 4
    t.string   "business_name",  limit: 255
    t.integer  "practi_info_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "practi_avails", ["practi_info_id"], name: "index_practi_avails_on_practi_info_id", using: :btree

  create_table "practi_breaks", force: :cascade do |t|
    t.integer  "start_hr",        limit: 4
    t.integer  "start_min",       limit: 4
    t.integer  "end_hr",          limit: 4
    t.integer  "end_min",         limit: 4
    t.integer  "practi_avail_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "practi_breaks", ["practi_avail_id"], name: "index_practi_breaks_on_practi_avail_id", using: :btree

  create_table "practi_infos", force: :cascade do |t|
    t.string   "designation",   limit: 255
    t.text     "desc",          limit: 65535
    t.string   "services_type", limit: 255
    t.string   "default_type",  limit: 255
    t.string   "notify_by",     limit: 255,   default: "email", null: false
    t.integer  "cancel_time",   limit: 4,     default: 7,       null: false
    t.boolean  "is_online",                   default: true,    null: false
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "practi_infos", ["user_id"], name: "index_practi_infos_on_user_id", using: :btree

  create_table "practi_refers", force: :cascade do |t|
    t.string   "ref_type",       limit: 255
    t.integer  "number",         limit: 4
    t.string   "business_name",  limit: 255
    t.integer  "practi_info_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "practi_refers", ["practi_info_id"], name: "index_practi_refers_on_practi_info_id", using: :btree

  create_table "quest_choices", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "q_type",      limit: 255
    t.integer  "question_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "quest_choices", ["question_id"], name: "index_quest_choices_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "title",           limit: 65535
    t.string   "q_type",          limit: 255
    t.integer  "temp_section_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "questions", ["temp_section_id"], name: "index_questions_on_temp_section_id", using: :btree

  create_table "sms_credits", force: :cascade do |t|
    t.integer  "avail_sms",      limit: 4
    t.integer  "sms_setting_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "sms_credits", ["sms_setting_id"], name: "index_sms_credits_on_sms_setting_id", using: :btree

  create_table "sms_settings", force: :cascade do |t|
    t.integer  "sms_alert_no", limit: 4
    t.string   "mob_no",       limit: 255
    t.text     "email",        limit: 65535
    t.integer  "company_id",   limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "sms_settings", ["company_id"], name: "index_sms_settings_on_company_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "doctors_no",        limit: 4
    t.date     "next_billing_date"
    t.integer  "monthly_fee",       limit: 4
    t.integer  "company_id",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "subscriptions", ["company_id"], name: "index_subscriptions_on_company_id", using: :btree

  create_table "tax_settings", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "amount",     limit: 4
    t.integer  "company_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tax_settings", ["company_id"], name: "index_tax_settings_on_company_id", using: :btree

  create_table "temp_sections", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "template_note_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "temp_sections", ["template_note_id"], name: "index_temp_sections_on_template_note_id", using: :btree

  create_table "template_notes", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "title",                 limit: 255
    t.boolean  "show_patient_addr",                 default: false, null: false
    t.boolean  "show_patient_dob",                  default: false, null: false
    t.boolean  "show_patient_medicare",             default: false, null: false
    t.boolean  "show_patient_occup",                default: false, null: false
    t.integer  "company_id",            limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "template_notes", ["company_id"], name: "index_template_notes_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.string   "email",         limit: 255
    t.string   "password_hash", limit: 255
    t.string   "password_salt", limit: 255
    t.boolean  "is_doctor",                   default: false, null: false
    t.text     "phone",         limit: 65535
    t.datetime "time_zone"
    t.boolean  "auth_factor",                 default: false, null: false
    t.string   "role",          limit: 255
    t.boolean  "acc_active",                  default: true,  null: false
    t.integer  "business_id",   limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "users", ["business_id"], name: "index_users_on_business_id", using: :btree

  add_foreign_key "appointment_types", "companies"
  add_foreign_key "billable_items", "companies"
  add_foreign_key "businesses", "companies"
  add_foreign_key "concessions", "companies"
  add_foreign_key "online_bookings", "companies"
  add_foreign_key "payment_settings", "companies"
  add_foreign_key "plans", "subscriptions"
  add_foreign_key "practi_avails", "practi_infos"
  add_foreign_key "practi_breaks", "practi_avails"
  add_foreign_key "practi_infos", "users"
  add_foreign_key "practi_refers", "practi_infos"
  add_foreign_key "quest_choices", "questions"
  add_foreign_key "questions", "temp_sections"
  add_foreign_key "sms_credits", "sms_settings"
  add_foreign_key "sms_settings", "companies"
  add_foreign_key "subscriptions", "companies"
  add_foreign_key "tax_settings", "companies"
  add_foreign_key "temp_sections", "template_notes"
  add_foreign_key "template_notes", "companies"
  add_foreign_key "users", "businesses"
end
