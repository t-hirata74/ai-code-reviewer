class CreateCodeEmbeddings < ActiveRecord::Migration[7.1]
  def change
    create_table :code_embeddings do |t|
      t.string :file_path, null: false
      t.string :content_hash, null: false
      t.vector :embedding, limit: 1536
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end

    add_index :code_embeddings, :file_path
    add_index :code_embeddings, :content_hash
    add_index :code_embeddings, :embedding, using: :ivfflat, opclass: :vector_cosine_ops
  end
end