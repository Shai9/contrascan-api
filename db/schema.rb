# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_12_28_192441) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "clauses", force: :cascade do |t|
    t.bigint "contract_id", null: false
    t.string "reference"
    t.text "text"
    t.integer "position_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_clauses_on_contract_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "title"
    t.integer "contract_type"
    t.string "status"
    t.text "raw_text"
    t.text "normalized_text"
    t.string "structure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "risk_matches", force: :cascade do |t|
    t.bigint "clause_id", null: false
    t.bigint "risk_pattern_id", null: false
    t.float "confidence"
    t.text "explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clause_id"], name: "index_risk_matches_on_clause_id"
    t.index ["risk_pattern_id"], name: "index_risk_matches_on_risk_pattern_id"
  end

  create_table "risk_patterns", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "severity"
    t.text "keywords"
    t.integer "applies_to"
    t.string "ai_label"
    t.text "user_facing_explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "risk_reports", force: :cascade do |t|
    t.bigint "contract_id", null: false
    t.integer "total_risks"
    t.float "risk_score"
    t.jsonb "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_risk_reports_on_contract_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clauses", "contracts"
  add_foreign_key "risk_matches", "clauses"
  add_foreign_key "risk_matches", "risk_patterns"
  add_foreign_key "risk_reports", "contracts"
end
