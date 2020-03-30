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

ActiveRecord::Schema.define(version: 2020_03_30_233559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "archive_categories", force: :cascade do |t|
    t.integer "archive_id", null: false
    t.integer "parent_id"
    t.string "slug", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "desc"
    t.index ["archive_id", "slug"], name: "index_archive_categories_on_archive_id_and_slug", unique: true
    t.index ["archive_id"], name: "index_archive_categories_on_archive_id"
    t.index ["parent_id"], name: "index_archive_categories_on_parent_id"
    t.index ["slug"], name: "index_archive_categories_on_slug"
  end

  create_table "archive_documents", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.integer "user_id", null: false
    t.integer "archive_id", null: false
    t.integer "comments_count", default: 0
    t.integer "likes_count", default: 0
    t.string "content_creator"
    t.string "content_created_time"
    t.string "content_source"
    t.string "content"
    t.string "content_name"
    t.string "content_type"
    t.integer "content_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_slug"
    t.string "media_type"
    t.string "content_created_date"
    t.string "content_recipients"
    t.string "donor"
    t.boolean "is_secret_donor"
    t.index ["archive_id"], name: "index_archive_documents_on_archive_id"
    t.index ["user_id"], name: "index_archive_documents_on_user_id"
  end

  create_table "archive_sewol_inv_documents", force: :cascade do |t|
    t.integer "archive_document_id"
    t.string "part_no"
    t.string "part_name"
    t.string "code"
    t.string "doc_no"
    t.string "report_date"
    t.string "doc_type"
    t.string "title"
    t.string "recipients"
    t.string "reporter"
    t.string "reviewer"
    t.string "has_attachment"
    t.string "status"
    t.string "doc_kind"
    t.string "open_type"
    t.text "open_level_desc"
    t.string "open_retype"
    t.text "open_relevel_desc"
    t.string "partial_open_redaction"
    t.string "prod_code_no"
    t.string "task_card_name"
    t.string "task_name"
    t.string "task_storaging_period"
    t.index ["archive_document_id"], name: "index_archive_sewol_inv_documents_on_archive_document_id"
  end

  create_table "archives", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.integer "user_id", null: false
    t.integer "comments_count", default: 0
    t.integer "likes_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["user_id"], name: "index_archives_on_user_id"
  end

  create_table "clypits", force: :cascade do |t|
    t.integer "archive_document_id", null: false
    t.string "audio_file_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["archive_document_id"], name: "index_clypits_on_archive_document_id"
    t.index ["audio_file_id"], name: "index_clypits_on_audio_file_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "role"
    t.string "name"
    t.string "birth"
    t.boolean "newsletter"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "taggings", "tags"
end
