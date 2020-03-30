class CreateClypits < ActiveRecord::Migration[5.2]
  def change
    create_table "clypits" do |t|
      t.integer  "archive_document_id", null: false
      t.string   "audio_file_id"
      t.datetime "created_at",          null: false
      t.datetime "updated_at",          null: false
      t.index ["archive_document_id"], name: "index_clypits_on_archive_document_id", using: :btree
      t.index ["audio_file_id"], name: "index_clypits_on_audio_file_id", using: :btree
    end
  end
end
