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

ActiveRecord::Schema[7.1].define(version: 2025_06_08_065909) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "vector"

  create_table "code_embeddings", force: :cascade do |t|
    t.string "file_path", null: false
    t.string "content_hash", null: false
    t.vector "embedding", limit: 1536
    t.bigint "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_hash"], name: "index_code_embeddings_on_content_hash"
    t.index ["embedding"], name: "index_code_embeddings_on_embedding", opclass: :vector_cosine_ops, using: :ivfflat
    t.index ["file_path"], name: "index_code_embeddings_on_file_path"
    t.index ["review_id"], name: "index_code_embeddings_on_review_id"
  end

  create_table "pull_requests", force: :cascade do |t|
    t.integer "number"
    t.string "title"
    t.string "state"
    t.string "github_id"
    t.bigint "repository_id", null: false
    t.bigint "user_id", null: false
    t.string "head_sha"
    t.string "base_sha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repository_id"], name: "index_pull_requests_on_repository_id"
    t.index ["user_id"], name: "index_pull_requests_on_user_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.string "github_id"
    t.bigint "user_id", null: false
    t.boolean "webhook_configured"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_repositories_on_user_id"
  end

  create_table "review_comments", force: :cascade do |t|
    t.string "file_path"
    t.integer "line_number"
    t.text "comment"
    t.string "severity"
    t.text "suggestion"
    t.bigint "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_review_comments_on_review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "status"
    t.integer "overall_score"
    t.text "summary"
    t.bigint "pull_request_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pull_request_id"], name: "index_reviews_on_pull_request_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "github_id"
    t.string "github_username"
    t.text "github_token"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["github_id"], name: "index_users_on_github_id", unique: true
    t.index ["github_username"], name: "index_users_on_github_username"
  end

  add_foreign_key "code_embeddings", "reviews"
  add_foreign_key "pull_requests", "repositories"
  add_foreign_key "pull_requests", "users"
  add_foreign_key "repositories", "users"
  add_foreign_key "review_comments", "reviews"
  add_foreign_key "reviews", "pull_requests"
  add_foreign_key "reviews", "users"
end
