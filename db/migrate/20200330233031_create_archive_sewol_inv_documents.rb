class CreateArchiveSewolInvDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table "archive_sewol_inv_documents" do |t|
      t.integer "archive_document_id"
      t.string  "part_no"
      t.string  "part_name"
      t.string  "code"
      t.string  "doc_no"
      t.string  "report_date"
      t.string  "doc_type"
      t.string  "title"
      t.string  "recipients"
      t.string  "reporter"
      t.string  "reviewer"
      t.string  "has_attachment"
      t.string  "status"
      t.string  "doc_kind"
      t.string  "open_type"
      t.text    "open_level_desc",        limit: 65535
      t.string  "open_retype"
      t.text    "open_relevel_desc",      limit: 65535
      t.string  "partial_open_redaction"
      t.string  "prod_code_no"
      t.string  "task_card_name"
      t.string  "task_name"
      t.string  "task_storaging_period"
      t.index ["archive_document_id"], name: "index_archive_sewol_inv_documents_on_archive_document_id", using: :btree
    end
  end
end
