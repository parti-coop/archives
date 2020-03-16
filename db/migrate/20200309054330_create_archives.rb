class CreateArchives < ActiveRecord::Migration[5.2]
  def change
    create_table "archives", force: :cascade do |t|
      t.string   "title",                                     null: false
      t.text     "body",            limit: 65535
      t.integer  "user_id",                                   null: false
      t.integer  "comments_count",                default: 0
      t.integer  "likes_count",                   default: 0
      t.datetime "created_at",                                null: false
      t.datetime "updated_at",                                null: false
      t.string   "slug"
      t.index ["user_id"], name: "index_archives_on_user_id", using: :btree
    end

    create_table "archive_categories", force: :cascade do |t|
      t.integer  "archive_id",               null: false
      t.integer  "parent_id"
      t.string   "slug",                     null: false
      t.string   "name",                     null: false
      t.datetime "created_at",               null: false
      t.datetime "updated_at",               null: false
      t.text     "desc",       limit: 65535
      t.index ["archive_id", "slug"], name: "index_archive_categories_on_archive_id_and_slug", unique: true, using: :btree
      t.index ["archive_id"], name: "index_archive_categories_on_archive_id", using: :btree
      t.index ["parent_id"], name: "index_archive_categories_on_parent_id", using: :btree
      t.index ["slug"], name: "index_archive_categories_on_slug", using: :btree
    end

    create_table "archive_documents", force: :cascade do |t|
      t.string   "title",                                          null: false
      t.text     "body",                 limit: 65535
      t.integer  "user_id",                                        null: false
      t.integer  "archive_id",                                     null: false
      t.integer  "comments_count",                     default: 0
      t.integer  "likes_count",                        default: 0
      t.string   "content_creator"
      t.string   "content_created_time"
      t.string   "content_source"
      t.string   "content"
      t.string   "content_name"
      t.string   "content_type"
      t.integer  "content_size"
      t.datetime "created_at",                                     null: false
      t.datetime "updated_at",                                     null: false
      t.string   "category_slug"
      t.string   "media_type"
      t.string   "content_created_date"
      t.string   "content_recipients"
      t.string   "donor"
      t.boolean  "is_secret_donor"
      t.index ["archive_id"], name: "index_archive_documents_on_archive_id", using: :btree
      t.index ["user_id"], name: "index_archive_documents_on_user_id", using: :btree
    end
  end
end
