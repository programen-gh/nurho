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

ActiveRecord::Schema.define(version: 2021_01_22_052842) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_favorites_on_service_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name", null: false
    t.string "address", null: false
    t.date "establishment", null: false
    t.integer "capacity", null: false
    t.integer "rooms", null: false
    t.string "phone", null: false
    t.text "explanation", null: false
    t.integer "category_id", null: false
    t.integer "prefecture_id", null: false
    t.integer "lump_sum_min", null: false
    t.integer "lump_sum_max", null: false
    t.integer "monthly_sum_min", null: false
    t.integer "monthly_sum_max", null: false
    t.integer "age_id", null: false
    t.integer "self_reliance", null: false
    t.integer "support_one", null: false
    t.integer "support_two", null: false
    t.integer "nursing_one", null: false
    t.integer "nursing_two", null: false
    t.integer "nursing_three", null: false
    t.integer "nursing_four", null: false
    t.integer "nursing_five", null: false
    t.integer "dementia", null: false
    t.integer "guarantor", null: false
    t.integer "welfare", null: false
    t.integer "take_care", null: false
    t.integer "care_food", null: false
    t.integer "liquid_food", null: false
    t.integer "rehabilitation", null: false
    t.integer "dm", null: false
    t.integer "gastrostomy", null: false
    t.integer "tube_feeding", null: false
    t.integer "stoma", null: false
    t.integer "home_oxygen_therapy", null: false
    t.integer "ventilator", null: false
    t.integer "bedsore", null: false
    t.integer "sputum_suction", null: false
    t.integer "dialysis", null: false
    t.integer "tracheostomy", null: false
    t.integer "ivh", null: false
    t.integer "catheter", null: false
    t.integer "pacemaker", null: false
    t.integer "als", null: false
    t.integer "aspiration_pneumonia", null: false
    t.integer "asthma", null: false
    t.integer "parkinson_disease", null: false
    t.integer "disuse_syndrome", null: false
    t.integer "clinical_depression", null: false
    t.integer "schizophrenia", null: false
    t.integer "rheumatism", null: false
    t.integer "osteoporosis", null: false
    t.integer "cerebral_infarction", null: false
    t.integer "myocardial_infarction", null: false
    t.integer "cancer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_services_on_company_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favorites", "services"
  add_foreign_key "favorites", "users"
  add_foreign_key "services", "companies"
end
